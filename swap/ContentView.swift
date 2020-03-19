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
    
    var body: some View {
        
        ZStack {
            
            EmptyView()
            
        }
        
    }
    
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
