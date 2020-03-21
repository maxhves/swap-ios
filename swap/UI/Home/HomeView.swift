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
    @State var showCurrencySelection: Bool = false
    
    // MARK: Observables
    @ObservedObject var keypadController = KeypadController()
    
    // MARK: Environment Objects
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                VStack(spacing: 0) {
                    
                    // MARK: Currency Display
//                    CurrencyDisplay()
                    
                    // TODO: Remove
//                    Text("\(self.keypadController.selectedKey)")
//                        .foregroundColor(.white)
//                        .font(.title)
                    
                    // TODO: Remove
                    self.homeViewModel.resource.hasResource { exchange in
//                        Button(action: {
//                            self.showCurrencySelection = true
//                        }) {
//                            Text("Open Sheet")
//                                .padding()
//                        }
//                        .background(Color.black)
//                        .cornerRadius(ViewConstants.regular)
//                        .sheet(isPresented: self.$showCurrencySelection) {
//                            CurrencySelectionView()
//                        }
                        Text("Please show up")
                            .foregroundColor(.white)
                    }
                    
//                    self.homeViewModel.resource.hasError() { error in
//                        Text("Error innit")
//                            .foregroundColor(.white)
//                    }
//
//                    self.homeViewModel.resource.isLoading() {
//                        Text("Loading innit")
//                            .foregroundColor(.white)
//                    }
                    
                    // MARK: Currency Swap
//                    CurrencySwap()
//                        .padding(.bottom)
                    
                    // MARK: Keypad
//                    Keypad(keypadController: self.keypadController)
//                        .frame(height: geometry.size.height / 3)
//                        .background(Color.backgroundAccent)
//                        .cornerRadius(ViewConstants.large)
//                        .padding(.bottom, geometry.safeAreaInsets.bottom)
//                        .padding(.leading)
//                        .padding(.trailing)
                    
                }
                .onAppear(perform: self.homeViewModel.onAppear)
                
            }
            
        }
        .background(Color.backgroundPrimary)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel.init(with: ExchangeRatesNetwork()))
    }
}
