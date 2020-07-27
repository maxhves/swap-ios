//
//  CurrencySelectionRow.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 06/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencySelectionRow: View {
    
    var currency: Currency
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(currency.name)")
            .font(.system(
                size: ViewConstants.fontMedium,
                weight: .bold,
                design: .monospaced)
            )
            .foregroundColor(Color.textPrimary)
            Spacer()
            Text("\(currency.fullName)")
                .font(.system(
                    size: ViewConstants.fontSmall,
                    weight: .regular,
                    design: .monospaced)
                )
                .foregroundColor(Color.textMedium)
                .padding(.trailing, ViewConstants.regular)
            Image("\(currency.name.lowercased())")
                .resizable()
                .frame(width: ViewConstants.selectionFlagSize, height: ViewConstants.selectionFlagSize)
        }
        .contentShape(Rectangle())
    }
}

struct CurrencySelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionRow(currency: Currency(name: "NOK", fullName: "Norwegian Kroners", continent: .Europe))
            .previewLayout(.fixed(width: 400, height: 50))
    }
}
