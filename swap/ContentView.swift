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
    static let backgroundAccent = Color("backgroundAccent")
    
    static let textBody = Color("textBody")
    static let textSecondary = Color("textSecondary")
    static let textStrong = Color("textStrong")
    static let keypadKey = Color("keypadKey")
    
    static let swapButton = Color("swapButton")
    static let swapButtonSecondary = Color("swapButtonSecondary")
    static let swapPrimary = Color("swapPrimary")
    static let swapSecondary = Color("swapSecondary")
    
    static let textPrimary = Color("textPrimary")
    
}

struct ContentView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    @State var showSplash = true
    
    var body: some View {
        
        ZStack {
            
            // Home
            HomeView()
                    .environment(\.managedObjectContext, managedObjectContext)
            
            // Splash
            SplashView()
                .opacity(showSplash ? 1 : 0)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation() {
                            self.showSplash = false
                        }
                    }
                }
            
        }
        
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
