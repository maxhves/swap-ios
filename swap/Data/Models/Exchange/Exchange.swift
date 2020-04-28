//
//  Exchange.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 08/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation


struct Exchange {
    
    var primary: Currency
    var secondary: Currency
    
    var currentValue: Decimal = 0.0 {
        didSet {
            if currentDisplayValue == "0" {
                currentDisplayValue = ""
            }

            switch self.currentValue {
            case -1:
                if !currentDisplayValue.contains(".") {
                    if currentDisplayValue.count == 0 {
                        currentDisplayValue = "0."
                    } else {
                        currentDisplayValue += "."
                    }
                }
            case -2:
                if currentDisplayValue.count <= 1 {
                    currentDisplayValue = "0"
                } else {
                    currentDisplayValue = String(currentDisplayValue.dropLast())
                }
            default:
                currentDisplayValue += "\(self.currentValue)"
            }
        }
    }
    
    var currentDisplayValue: String = "0"
    
}
