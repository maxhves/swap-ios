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
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                
                Text("NOK")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Norwegian Kroners")
                    .font(.caption)
                    .foregroundColor(.white)
                
            }
            
            Spacer()
            
        }
        .listRowBackground(Color.black)
        
    }
}

struct CurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRow()
            .previewLayout(.fixed(width: 300, height: 44))
            .background(Color.black)
    }
}
