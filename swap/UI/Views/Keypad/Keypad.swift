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
    
    @Binding var exchange: Exchange
    
    var body: some View {
        
        GeometryReader { geometry in
            GridStack(rows: ViewConstants.keypadRows, columns: ViewConstants.keypadColumns) { row, column in
                Button(action: {
                    let index = row * ViewConstants.keypadColumns + column
                    self.handleKeyPressed(index)
                }) {
                    if (row * ViewConstants.keypadColumns + column) == 11 {
                        Image(systemName: "delete.left.fill")
                            .foregroundColor(Color.keypadKey)
                            .frame(
                                width: geometry.size.width / 3,
                                height: (geometry.size.height - ViewConstants.keypadPadding) / 4
                            )
                    } else {
                        Text("\(self.keys[row * ViewConstants.keypadColumns + column])")
                            .font(.system(
                                size: ViewConstants.keyFontSize,
                                weight: .semibold,
                                design: .rounded)
                            )
                            .foregroundColor(Color.keypadKey)
                            .frame(
                                width: geometry.size.width / 3,
                                height: (geometry.size.height - ViewConstants.keypadPadding) / 4
                            )
                    }
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
        exchange.currentValue = keyIndexAsInt(keyIndex)
    }
    
    private func keyIndexAsInt(_ index: Int) -> Decimal {
        switch index {
        case 0:
            return 7
        case 1:
            return 8
        case 2:
            return 9
        case 3:
            return 4
        case 4:
            return 5
        case 5:
            return 6
        case 6:
            return 1
        case 7:
            return 2
        case 8:
            return 3
        case 9:
            return -1
        case 10:
            return 0
        case 11:
            return -2
        default:
            return 0
        }
    }
    
}

struct Keypad_Previews: PreviewProvider {
    static var previews: some View {
        Keypad(
            exchange: .constant(Exchange(
                primary: Currency(name: "NOK", fullName: "Norwegian Kroners"),
                secondary: Currency(name: "USD", fullName: "United States Dollars")
            ))
        )
    }
}
