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
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
            
                ZStack {
                    
                    Text("Currency Selection")
                        .frame(width: geometry.size.width)
                        .background(Color.red)
                    
                }
                
                List {
                    
                    ForEach(1...33, id: \.self) { n in
                        CurrencyRow()
                    }
                    
                }
                
            }.background(Color.blue.edgesIgnoringSafeArea(.all))
            
        }
        
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView()
    }
}
