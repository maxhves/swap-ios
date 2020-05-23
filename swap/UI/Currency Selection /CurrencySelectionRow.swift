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
        HStack {
            Text("\(currency.name)")
            .font(.system(
                size: ViewConstants.fontBody,
                weight: .bold,
                design: .rounded)
            )
            .foregroundColor(Color.textStrong)
            Spacer()
            Text("\(currency.fullName)")
                .font(.system(
                    size: ViewConstants.fontBody,
                    weight: .medium,
                    design: .rounded)
                )
                .foregroundColor(Color.textBody)
            Image("\(currency.name.lowercased())")
                .resizable()
                .frame(width: 16, height: 16)
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
