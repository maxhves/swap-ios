//
//  CurrencySwap.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 03/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencySwap: View {
    
    @Binding var showCurrencySelection: Bool
    @Binding var selection: String
    @Binding var exchange: Exchange
    
    var body: some View {
        
        HStack {
            
            // Primary
            Button(action: {
                self.selection = "primary"
                self.showCurrencySelection.toggle()
            }) {
                Text(self.exchange.primary.name)
                    .font(.system(
                        size: ViewConstants.swapFontSize,
                        weight: .semibold,
                        design: .rounded)
                    )
                    .foregroundColor(Color.textSecondary)
            }
            .frame(height: ViewConstants.swapButtonSize)
            .padding(.leading, ViewConstants.medium)
            .padding(.trailing, ViewConstants.medium)
            .background(Color.swapPrimary)
            .cornerRadius(ViewConstants.large)
            
            // Swap
            Button(action: {}) {
                Image(systemName: "arrow.right.arrow.left.circle")
                    .resizable()
                    .frame(width: ViewConstants.swapIconSize, height: ViewConstants.swapIconSize)
                    .foregroundColor(Color.textSecondary)
            }
            .frame(width: ViewConstants.swapButtonSize, height: ViewConstants.swapButtonSize)
            .background(Color.swapButton)
            .cornerRadius(ViewConstants.large)
            
            // Secondary
            Button(action: {
                self.selection = "secondary"
                self.showCurrencySelection.toggle()
            }) {
                Text(self.exchange.secondary.name)
                    .font(.system(
                        size: ViewConstants.swapFontSize,
                        weight: .semibold,
                        design: .rounded)
                    )
                    .foregroundColor(Color.textSecondary)
            }
            .frame(height: ViewConstants.swapButtonSize)
            .padding(.leading, ViewConstants.medium)
            .padding(.trailing, ViewConstants.medium)
            .background(Color.swapSecondary)
            .cornerRadius(ViewConstants.large)
            
        }
        
    }
}

struct CurrencySwap_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySwap(
            showCurrencySelection: .constant(false),
            selection: .constant("primary"),
            exchange: .constant(
                Exchange(
                    primary: Currency(name: "NOK", fullName: ""),
                    secondary: Currency(name: "USD", fullName: ""))))
    }
}
