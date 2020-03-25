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
    
}

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            HomeView()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
