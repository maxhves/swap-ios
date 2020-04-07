//
//  CurrencySelectionView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 06/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencySelectionView: View {
    
    private let currencies = Currency.provideCurrencyList()
    
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
                                CurrencySelectionRow(currency: currency)
                            }
                        }
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            }
            .navigationBarTitle(Text("Select Currency"), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {}) {
                    Text("Cancel")
                }
            )
            
        }
        
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView()
    }
}
