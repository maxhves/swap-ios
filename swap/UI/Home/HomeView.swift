//
//  HomeView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 23/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model: HomeViewModel = HomeViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var showCurrencySelection: Bool = false
    @State private var exchange: Exchange = Exchange(
        primary: Currency(name: "NOK", fullName: "Norwegian Kroners", continent: .Europe),
        secondary: Currency(name: "USD", fullName: "United States Dollars", continent: .NorthAmerica)
    )
    @State private var selection: String = "primary"

    @FetchRequest(entity: LocalRate.entity(), sortDescriptors: []) var rates: FetchedResults<LocalRate>

    var body: some View {

        GeometryReader { geometry in

            VStack(spacing: 0) {

                // Exchange Display
                ExchangeDisplay(exchange: self.$exchange)

                // Test Fetch Results
                if self.model.ratesFetched {
                    Text("Fetched them boss")
                            .padding()
                            .foregroundColor(.blue)
                            .onAppear {
                                print("Current count: \(self.rates.count)")
                                self.clearExistingRates()
                                print("After deletion count: \(self.rates.count)")
                                self.storeRatesLocally()
                                print("After storing count: \(self.rates.count)")
                            }
                }

                // Currency Swap
                CurrencySwap(
                    showCurrencySelection: self.$showCurrencySelection,
                    selection: self.$selection,
                    exchange: self.$exchange)
                    .padding(.bottom, ViewConstants.medium)
                    .sheet(isPresented: self.$showCurrencySelection) {
                        CurrencySelectionView(
                            showCurrencySelection: self.$showCurrencySelection,
                            exchange: self.$exchange,
                            selection: self.$selection)
                            .onDisappear {
                                print("Before \(self.exchange.testRate)")
                                self.exchange.testRate = self.rates.first { rate in
                                   rate.base == self.exchange.primary.name
                                }.map { localRate in Rate(base: localRate.base ?? "", date: "", rates: ["": 0.0])}
                                print("After \(self.exchange.testRate)")
                            }
                    }

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

    private func clearExistingRates() {
        rates.forEach { rate in
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
            let localRate = LocalRate(context: managedObjectContext)
            localRate.id = rate.id
            localRate.base = rate.base

            do {
                try managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
