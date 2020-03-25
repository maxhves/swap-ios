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
    
    @State var keyPressed: Int = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            GridStack(rows: ViewConstants.keypadRows, columns: ViewConstants.keypadColumns) { row, column in
                Button(action: {
                    let index = row * ViewConstants.keypadColumns + column
                    self.handleKeyPressed(index)
                }) {
                    Text("\(self.keys[row * ViewConstants.keypadColumns + column])")
                        .font(.system(
                            size: ViewConstants.keyFontSize,
                            weight: .semibold,
                            design: .rounded)
                        )
                        .foregroundColor(Color.textBody)
                        .frame(
                            width: geometry.size.width / 3,
                            height: (geometry.size.height - ViewConstants.keypadPadding) / 4
                        )
                }
            }
        }
        
    }
    
    /**
     Handle when a keypad key is selected by changing the key state
     - Parameters:
        - keyIndex: the index of the pressed key
     */
    private func handleKeyPressed(_ keyIndex: Int) {
        keyPressed = keyIndex
    }
    
}

struct Keypad_Previews: PreviewProvider {
    static var previews: some View {
        Keypad()
    }
}
