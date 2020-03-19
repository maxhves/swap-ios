//
//  KeypadKey.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 19/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

class KeypadController: ObservableObject {
    
    // MARK: Observables
    @Published var selectedKey: Int = 0
    
    // MARK: Helper Functions
    static func stringAsKeypadKey(value: String) -> KeypadKey {
        switch value {
        case "0":
            return KeypadKey.Zero
        case "1":
            return KeypadKey.One
        case "2":
            return KeypadKey.Two
        case "3":
            return KeypadKey.Three
        case "4":
            return KeypadKey.Four
        case "5":
            return KeypadKey.Five
        case "6":
            return KeypadKey.Six
        case "7":
            return KeypadKey.Seven
        case "8":
            return KeypadKey.Eight
        case "9":
            return KeypadKey.Nine
        case ".":
            return KeypadKey.Decimal
        case "-":
            return KeypadKey.Backspace
        default:
            return KeypadKey.Backspace
        }
    }
    
}
