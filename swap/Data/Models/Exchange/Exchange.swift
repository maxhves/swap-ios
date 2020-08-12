//
//  Exchange.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 08/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation


struct Exchange {

    // MARK: Static constants
    private static let primaryEmpty: String = "0"
    private static let secondaryEmpty: String = "0.00"

    // MARK: Properties
    var primary: Currency
    var secondary: Currency

    var primaryRate: Rate? = nil
    var secondaryRate: Rate? = nil
    
    var swapped: Bool = false {
        didSet {
            
        }
    }
    
    var currentValue: Decimal = 0.0 {
        didSet {
            if focussedValueDisplay == "0" {
                focussedValueDisplay = ""
            }

            switch self.currentValue {
            case -1:
                if !focussedValueDisplay.contains(".") {
                    if focussedValueDisplay.count == 0 {
                        focussedValueDisplay = "0."
                    } else {
                        focussedValueDisplay += "."
                    }
                }
            case -2:
                if focussedValueDisplay.count <= 1 {
                    focussedValueDisplay = Exchange.primaryEmpty
                } else {
                    focussedValueDisplay = String(focussedValueDisplay.dropLast())
                }
            default:
                focussedValueDisplay += "\(self.currentValue)"
            }
            
            let primaryValue = Decimal(string: focussedValueDisplay)

            let finalValue = ((primaryValue ?? 0) * conversionRate())
            let finalValueDouble = Double(exactly: finalValue as NSDecimalNumber) ?? 0.0

            unfocussedValueDisplay = String(format: "%.2f", finalValueDouble)
        }
    }
    
    var primaryValueDisplay: String = Exchange.primaryEmpty
    var secondaryValueDisplay: String = Exchange.secondaryEmpty
    
}

extension Exchange {

    private var focussedValueDisplay: String {
        get {
            return (swapped) ? secondaryValueDisplay : primaryValueDisplay
        }
        set {
            if (swapped) {
                secondaryValueDisplay = newValue
            } else {
                primaryValueDisplay = newValue
            }
        }
    }
    
    private var unfocussedValueDisplay: String {
        get {
            return (swapped) ? primaryValueDisplay : secondaryValueDisplay
        }
        set {
            if (swapped) {
                primaryValueDisplay = newValue
            } else {
                secondaryValueDisplay = newValue
            }
        }
    }
    
    // MARK: Transformations
    private func conversionRate() -> Decimal {
        guard let result =
            (swapped) ?
                (secondaryRate?.rates.first { rate in rate.key == primary.name }?.value) :
                (primaryRate?.rates.first { rate in rate.key == secondary.name }?.value) else {
            return 0.0
        }
        return result
    }

    mutating func clear() {
        primaryValueDisplay = (swapped) ? Exchange.secondaryEmpty : Exchange.primaryEmpty
        secondaryValueDisplay = (swapped) ? Exchange.primaryEmpty : Exchange.secondaryEmpty
    }
    
    mutating func resetToInitial() {
        if (primaryValueDisplay == Exchange.primaryEmpty || primaryValueDisplay == Exchange.secondaryEmpty) {
            clear()
        }
    }
    
    mutating func refreshConverstion() {
        let currentVal = self.currentValue
        clear()
        self.currentValue = currentVal
    }

}
