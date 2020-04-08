//
//  CurrencySelectionView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 06/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencySelectionView: View {
    
    @Binding var showCurrencySelection: Bool
    
    private let currencies = Currency.provideCurrencyList()
    
    var selection: String
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 0) {
                
                List {

                    ForEach(currencies) { section in
                        Section(header:
                            Text(section.title)
                                .padding(.top, section.title == "Africa" ? ViewConstants.medium : 0)
                        ) {
                            ForEach(section.currencies) { currency in
                                Button(action: {
                                    self.showCurrencySelection.toggle()
                                }) {
                                    CurrencySelectionRow(currency: currency)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            }
            .navigationBarTitle(Text("Select Currency"))
            
        }
        
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView(showCurrencySelection: .constant(true),selection: "primary")
    }
}
