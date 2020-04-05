//
//  CurrencySwap.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 03/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencySwap: View {
    var body: some View {
        
        HStack {
            
            // Primary
            Button(action: {}) {
                Text("NOK")
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
            Button(action: {}) {
                Text("USD")
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
        CurrencySwap()
    }
}
