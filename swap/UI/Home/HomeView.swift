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
    
    @State private var primaryCurrency: String = "NOK"
    @State private var secondaryCurrency: String = "USD"
    @State private var selection: String = "primary"
    
    @EnvironmentObject var model: HomeViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Exchange Display
                ExchangeDisplay()
                
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
                    primary: "\(self.primaryCurrency)",
                    secondary: "\(self.secondaryCurrency)")
                    .padding(.bottom, ViewConstants.medium)
                    .sheet(isPresented: self.$showCurrencySelection) {
                        CurrencySelectionView(
                            showCurrencySelection: self.$showCurrencySelection,
                            primaryCurrency: self.$primaryCurrency,
                            secondaryCurrency: self.$secondaryCurrency,
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
