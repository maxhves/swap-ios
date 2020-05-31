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

    var primaryRate: Rate? = nil
    var secondaryRate: Rate? = nil
    
    var currentValue: Decimal = 0.0 {
        didSet {
            if primaryValueDisplay == "0" {
                primaryValueDisplay = ""
            }

            switch self.currentValue {
            case -1:
                if !primaryValueDisplay.contains(".") {
                    if primaryValueDisplay.count == 0 {
                        primaryValueDisplay = "0."
                    } else {
                        primaryValueDisplay += "."
                    }
                }
            case -2:
                if primaryValueDisplay.count <= 1 {
                    primaryValueDisplay = "0"
                } else {
                    primaryValueDisplay = String(primaryValueDisplay.dropLast())
                }
            default:
                primaryValueDisplay += "\(self.currentValue)"
            }
            
            let primaryValue = Decimal(string: primaryValueDisplay)
            secondaryValueDisplay = "\((primaryValue ?? 0) * conversionRate())"
        }
    }
    
    var primaryValueDisplay: String = "0"
    var secondaryValueDisplay: String = "0"
    
}

extension Exchange {

    // MARK: Transformations
    private func conversionRate() -> Decimal {
        let rate = primaryRate?.rates.first { rate in rate.key == secondary.name }
        if let rate = rate { return rate.value }
        return 0.0
    }

}
