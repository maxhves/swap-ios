//
//  HomeView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 23/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Placeholder")
                    Spacer()
                }
                Keypad()
                    .background(Color.white)
                    .cornerRadius(32)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height / 2.5
                    )
            }
            .background(Color.background)
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
