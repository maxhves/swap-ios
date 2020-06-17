//
//  SplashView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 03/06/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        GeometryReader { geometry in
        
            ZStack {
                
                Image("swap_branding_icon")
                    .resizable()
                    .frame(width: ViewConstants.splashIconSize, height: ViewConstants.splashIconSize)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.backgroundAccent)
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
