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

    @State private var showCurrencySelection: Bool = false
    @State private var exchange: Exchange = Exchange(
        primary: Currency(name: "NOK", fullName: "Norwegian Kroners", continent: .Europe),
        secondary: Currency(name: "USD", fullName: "United States Dollars", continent: .NorthAmerica)
    )
    @State private var selection: String = "primary"
    
    @FetchRequest(entity: LocalRate.entity(), sortDescriptors: []) var rates: FetchedResults<LocalRate>
    @SwiftUI.Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Exchange Display
                ExchangeDisplay(exchange: self.$exchange)
                
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

    private func printRate(rate: Rate) {
        print(rate)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
