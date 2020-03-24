//
//  Keypad.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 23/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct Keypad: View {
    
    let keys: [String] = ["7", "8", "9", "4", "5", "6", "1", "2", "3", ".", "0", "-"]
    
    var body: some View {
        
        GeometryReader { geometry in
            GridStack(rows: ViewConstants.keypadRows, columns: ViewConstants.keypadColumns) { row, column in
                Button(action: {}) {
                    Text("\(self.keys[row * ViewConstants.keypadColumns + column])")
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(Color.gray)
                        .frame(
                            width: geometry.size.width / 3,
                            height: (geometry.size.height - ViewConstants.keypadPadding) / 4
                        )
                }
            }
        }
        
    }
}

struct Keypad_Previews: PreviewProvider {
    static var previews: some View {
        Keypad()
    }
}
