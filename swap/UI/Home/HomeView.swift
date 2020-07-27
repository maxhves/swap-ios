//
//  HomeView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 23/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var model: HomeViewModel = HomeViewModel()

    @State private var showCurrencySelection: Bool = false
    @State private var showErrorAlert: Bool = false
    @State private var exchange: Exchange = Exchange(
        primary: Currency(name: "NOK", fullName: "NorwegianKroner".localized(), continent: .Europe),
        secondary: Currency(name: "USD", fullName: "UnitedStatesDollars".localized(), continent: .NorthAmerica)
    )
    @State private var selection: String = "primary"

    @FetchRequest(entity: ManagedRate.entity(), sortDescriptors: []) var managedRates: FetchedResults<ManagedRate>
    @FetchRequest(entity: ManagedCurrencyRate.entity(), sortDescriptors: []) var managedCurrencyRates: FetchedResults<ManagedCurrencyRate>

    var body: some View {

        GeometryReader { geometry in

            VStack(spacing: 0) {

                // Exchange Display
                ExchangeDisplay(exchange: self.$exchange)

                // On Results Fetched
                if self.model.ratesFetched {
                    Text("")
                        .frame(width: 0, height: 0)
                        .onAppear {
                            DispatchQueue.main.async {
                                self.clearExistingRates()
                                self.storeRatesLocally()
                                self.updateExchanges()
                            }
                        }
                }

                // On Result Error
                if self.model.error != nil {
                    Text("")
                        .frame(width: 0, height: 0)
                        .onAppear {
                            self.showErrorAlert = true
                        }
                        .alert(isPresented: self.$showErrorAlert) {
                            Alert(
                                title: Text("ErrorNetTitle"), 
                                message: Text("ErrorNetBody"),
                                primaryButton: .default(Text("ErrorRetry")) {
                                    self.showErrorAlert = false
                                    self.model.reFetchCurrencyRates()
                                },
                                secondaryButton: .cancel(Text("ErrorBack"))
                            )
                        }
                }

                // Currency Swap
//                CurrencySwap(
//                    showCurrencySelection: self.$showCurrencySelection,
//                    selection: self.$selection,
//                    exchange: self.$exchange)
//                    .padding(.bottom, ViewConstants.medium)
//                    .sheet(isPresented: self.$showCurrencySelection) {
//                        CurrencySelectionView(
//                            showCurrencySelection: self.$showCurrencySelection,
//                            exchange: self.$exchange,
//                            selection: self.$selection)
//                            .onDisappear {
//                                DispatchQueue.main.async {
//                                    self.updateExchanges()
//                                }
//                            }
//                    }

                // Keypad
                Keypad(exchange: self.$exchange)
                    .background(Color.backgroundAccent)
                    .cornerRadius(ViewConstants.large)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height / ViewConstants.keypadHeightRatio
                    )
            }
            .background(Color.background)
            .edgesIgnoringSafeArea(.all)

        }

    }

}

extension HomeView {

    private func clearExistingRates() {
        managedRates.forEach { rate in
            managedObjectContext.delete(rate)
        }

        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    private func storeRatesLocally() {
        model.fetchedRates.forEach { rate in
            let managedRate = ManagedRate(context: managedObjectContext)
            managedRate.id = rate.id
            managedRate.base = rate.base

            rate.rates.forEach { key, value in
                let managedCurrencyRate = ManagedCurrencyRate(context: managedObjectContext)
                managedCurrencyRate.ofRate = managedRate
                managedCurrencyRate.name = key
                managedCurrencyRate.value = NSDecimalNumber(decimal: value)
                managedCurrencyRate.rateId = rate.id
            }

            do {
                try self.managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

extension HomeView {

    private func updateExchanges() {
        updatePrimaryExchangeRate()
        updateSecondaryExchangeRate()
    }

    private func updatePrimaryExchangeRate() {
        guard let pmr = (self.managedRates.first { r in r.base == exchange.primary.name}) else {
            return
        }
        let pmrRates = self.managedCurrencyRates.filter { cr in cr.rateId == pmr.id }
        exchange.primaryRate = Rate.managedRateAsRate(rate: pmr, currencyRates: pmrRates)
    }

    private func updateSecondaryExchangeRate() {
        guard let smr = (self.managedRates.first { r in r.base == exchange.secondary.name}) else {
            return
        }
        let smrRates = self.managedCurrencyRates.filter { cr in cr.rateId == smr.id }
        exchange.secondaryRate = Rate.managedRateAsRate(rate: smr, currencyRates: smrRates)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
