//
//  ContentView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 16/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

// MARK: Color Extension
extension Color {
    static let backgroundPrimary = Color("backgroundPrimary")
    static let backgroundAccent = Color("backgroundAccent")
    static let colorAccentPrimary = Color("colorAccentPrimary")
    static let colorAccentSecondary = Color("colorAccentSecondary")
}

// MARK: Content View
struct ContentView: View {
    
    // MARK: Observables
    @ObservedObject var keypadController = KeypadController()
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                // MARK: Currency Display
                CurrencyDisplay()
                
                Text("\(self.keypadController.selectedKey)")
                    .foregroundColor(.white)
                    .font(.title)
                
                // MARK: Currency Swap
                CurrencySwap()
                    .padding(.bottom)
                
                // MARK: Keypad
                Keypad(keypadController: self.keypadController)
                    .frame(height: geometry.size.height / 3)
                    .background(Color.backgroundAccent)
                    .cornerRadius(ViewConstants.large)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .padding(.leading)
                    .padding(.trailing)
                
            }
            
        }
        .background(Color.backgroundPrimary)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
