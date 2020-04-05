//
//  ContentView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 23/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

extension Color {

    static let background = Color("background")
    
    static let textBody = Color("textBody")
    static let textSecondary = Color("textSecondary")
    static let keypadKey = Color("keypadKey")
    
    static let swapButton = Color("swapButton")
    static let swapPrimary = Color("swapPrimary")
    static let swapSecondary = Color("swapSecondary")
    
}

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            HomeView()
                .environmentObject(HomeViewModel.init(with: ExchangeRatesNetwork()))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
