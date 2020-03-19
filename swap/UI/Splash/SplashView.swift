//
//  Splash.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 19/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image(systemName: "coloncurrencysign.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.backgroundPrimary)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
