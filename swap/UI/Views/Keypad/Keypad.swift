//
//  Keypad.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 16/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct Keypad: View {
    let keys: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0", "-"]
    
    var body: some View {
        GeometryReader { geometry in
            GridStack(rows: 4, columns: 3) { row, col in
                Button(action: { }) {
                    Text("\(self.keys[row * 3 + col])")
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width / 3, height: geometry.size.height / 4 - 8)
                }
            }
        }
    }
}

struct Keypad_Previews: PreviewProvider {
    static var previews: some View {
        Keypad()
            .background(Color.backgroundPrimary)
            .edgesIgnoringSafeArea(.all)
    }
}
