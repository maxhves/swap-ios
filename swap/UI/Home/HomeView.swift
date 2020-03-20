//
//  HomeView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 19/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    // MARK: States
    @State var showCurrencySelection: Bool = true
    
    // MARK: Observables
    @ObservedObject var keypadController = KeypadController()
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                VStack {
                    
                    // MARK: Currency Display
                    CurrencyDisplay()
                    
                    // TODO: Remove
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
                
                BottomSheetView(isOpen: self.$showCurrencySelection, maxHeight: geometry.size.height / 2) {
                    Text("Okay")
                }
                
            }
            
        }
        .background(Color.backgroundPrimary)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
