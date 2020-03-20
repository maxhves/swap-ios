//
//  CurrencyRow.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 20/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencyRow: View {
    var body: some View {
        
        HStack(spacing: 0) {
            
            Image(systemName: "flag.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.leading)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                
                Text("NOK")
                    .font(.headline)
                Text("Norwegian Kroners")
                    .font(.caption)
                
            }
            
            Spacer()
            
        }
        
    }
}

struct CurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRow()
            .previewLayout(.fixed(width: 350, height: 44))
    }
}
