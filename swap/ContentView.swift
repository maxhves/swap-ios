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
}

// MARK: Content View
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                EmptyView()
                
                Spacer()
                
                Keypad()
                    .frame(height: geometry.size.height / 3)
                    .background(Color.backgroundAccent)
                    .cornerRadius(32)
                    .padding()
                
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
