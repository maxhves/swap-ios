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
    
}

struct ContentView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
        ZStack {
            
            // Home View 
            HomeView()
                    .environment(\.managedObjectContext, managedObjectContext)
            
        }
        
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView_Previews.previews)
    }
    #endif
}
