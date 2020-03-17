//
//  CurrencyDisplay.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 17/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencyDisplay: View {
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                // MARK: Primary Display
                VStack {
                    Spacer()
                    HStack {
                        CurrencyDisplayDetail()
                        Spacer()
                    }
                    .padding()
                }
                .frame(height: geometry.size.height / 2)
                .background(Color.backgroundAccent)
                
                // MARK: Secondary Display
                VStack {
                    HStack {
                        CurrencyDisplayDetail()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .frame(height: geometry.size.height / 2)
                
            }
            
        }
    }
}

struct CurrencyDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDisplay()
            .background(Color.backgroundPrimary)
            .edgesIgnoringSafeArea(.all)
    }
}
