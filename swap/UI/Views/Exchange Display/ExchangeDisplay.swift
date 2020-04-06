//
//  ExchangeDisplay.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 29/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct ExchangeDisplay: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Primary
                HStack {
                    VStack {
                        
                        Spacer()
                        ExchangeDisplayDetail(value: "0", name: "Norwegian Kroners")
                        
                    }
                    Spacer()
                }
                .background(Color.backgroundAccent)
                
                // Secondary
                HStack {
                    VStack {
                        
                        ExchangeDisplayDetail(value: "0", name: "United States Dollars")
                        Spacer()
                        
                    }
                    Spacer()
                }
                
            }
            
        }
        
    }
}

struct ExchangeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplay()
            .background(Color.background)
    }
}
