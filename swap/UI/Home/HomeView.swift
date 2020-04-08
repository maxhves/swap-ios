//
//  HomeView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 23/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var key: Int = 0
    @State private var showCurrencySelection: Bool = false
    
    @State private var exchange: Exchange = Exchange(
        primary: Currency(name: "NOK", fullName: "Norwegian Kroners"),
        secondary: Currency(name: "USD", fullName: "United States Dollars")
    )
    @State private var selection: String = "primary"
    
    @EnvironmentObject var model: HomeViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Exchange Display
                ExchangeDisplay(exchange: self.$exchange)
                
//                HStack {
//                    self.model.resource.hasResource { rate in
//                        Text("Base: \(rate.base)\nDate: \(rate.date)")
//                            .padding()
//                    }
//                    Spacer()
//                }
                
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
                Keypad(keyPressed: self.$key)
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
            .onAppear(perform: self.model.onAppear)
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel(with: ExchangeRatesNetwork()))
    }
}
