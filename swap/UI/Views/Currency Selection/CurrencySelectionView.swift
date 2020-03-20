//
//  CurrencySelectionView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 20/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencySelectionView: View {
        
    init() {
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        
        VStack {
        
            List {
                
                CurrencyRow()
                CurrencyRow()
                CurrencyRow()
                CurrencyRow()
                CurrencyRow()
                CurrencyRow()
                CurrencyRow()
                CurrencyRow()
                
                
            }
            
        }
        
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView()
    }
}
