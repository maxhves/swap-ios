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
    
    @State var primaryOffsetX: CGFloat = 0
    
    @State var swapped: Bool = false
    
    var body: some View {
        
        HStack(spacing: ViewConstants.small) {
            
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
                    .foregroundColor(.white)
                    .frame(width: ViewConstants.swapButtonWidth, height: ViewConstants.swapButtonHeight)
            }
            .background(Color.swapPrimary)
            .cornerRadius(ViewConstants.large)
            .offset(x: self.primaryOffsetX, y: 0)
            
            // Swap
            Button(action: {
                withAnimation(.easeInOut(duration: 0.2), {
                    if !self.swapped {
                        self.primaryOffsetX = 144
                        self.swapped = true
                    } else {
                        self.primaryOffsetX = 0
                        self.swapped = false
                    }
                })
            }) {
                Image(systemName: "arrow.2.circlepath")
                    .font(.system(size: ViewConstants.swapIconSize, weight: .black))
                    .foregroundColor(Color.swapButtonSecondary)
            }
            .frame(width: ViewConstants.swapButtonHeight, height: ViewConstants.swapButtonHeight)
            .background(Color.swapButton)
            .cornerRadius(ViewConstants.large)
            .overlay(
                RoundedRectangle(cornerRadius: ViewConstants.large)
                    .stroke(Color.swapButtonSecondary, lineWidth: ViewConstants.swapButtonBorderWidth)
            )
            .zIndex(1.0)
            
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
                    .foregroundColor(.white)
                    .frame(width: ViewConstants.swapButtonWidth, height: ViewConstants.swapButtonHeight)
            }
            .background(Color.swapSecondary)
            .cornerRadius(ViewConstants.large)
            .offset(x: -self.primaryOffsetX, y: CGFloat(0.0))
            
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
                    primary: Currency(name: "NOK", fullName: "", continent: .Europe),
                    secondary: Currency(name: "USD", fullName: "", continent: .NorthAmerica))))
    }
}
