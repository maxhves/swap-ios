//
//  ExchangeDisplay.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 29/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct ExchangeDisplay: View {
    
    @Binding var exchange: Exchange
    @Binding var showCurrencySelection: Bool
    @Binding var selection: String
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                VStack(spacing: 0) {
                    
                    // Primary
                    HStack {
                        VStack {
                            Spacer()
                            ExchangeDisplayDetail(value: "\(self.exchange.primaryValueDisplay)", name: self.exchange.primary.fullName)
                                .onTapGesture() {
                                    self.openCurrencySelection("primary")
                                }
                        }
                        Spacer()
                    }
                    .background(Color.backgroundAccent)
                    
                    // Secondary
                    HStack {
                        VStack {
                            ExchangeDisplayDetail(value: "\(self.exchange.secondaryValueDisplay)", name: self.exchange.secondary.fullName)
                                .onTapGesture {
                                    self.openCurrencySelection("secondary")
                                }
                            Spacer()
                        }
                        Spacer()
                    }
                    
                }
                
                // Swap Button
                Button(action: {
                    // TODO Swap the detail views
                }) {
                    Image(systemName: "arrow.2.squarepath")
                        .foregroundColor(Color.white)
                }
                .frame(
                    width: ViewConstants.swapButtonSize,
                    height: ViewConstants.swapButtonSize
                )
                .background(Color.black)
                .cornerRadius(ViewConstants.large)
                
            }
        }
        
    }
    
    func openCurrencySelection(_ selection: String) {
        self.selection = selection
        self.showCurrencySelection.toggle()
    }
    
}

struct ExchangeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplay(
            exchange: .constant(Exchange(
                primary: Currency(name: "NOK", fullName: "Norwegian Kroners", continent: .Europe),
                secondary: Currency(name: "USD", fullName: "United States Dollars", continent: .NorthAmerica)
            )),
            showCurrencySelection: .constant(false),
            selection: .constant("primary")
        )
        .background(Color.background)
    }
}
