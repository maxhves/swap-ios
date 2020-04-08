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
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Primary
                HStack {
                    VStack {
                        
                        Spacer()
                        ExchangeDisplayDetail(value: "0", name: self.exchange.primary.fullName)
                        
                    }
                    Spacer()
                }
                .background(Color.backgroundAccent)
                
                // Secondary
                HStack {
                    VStack {
                        
                        ExchangeDisplayDetail(value: "0", name: self.exchange.secondary.fullName)
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
        ExchangeDisplay(
            exchange: .constant(Exchange(
                primary: Currency(name: "", fullName: ""),
                secondary: Currency(name: "", fullName: "")
            ))
        )
        .background(Color.background)
    }
}
