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
            currentDisplayValue += "\(self.currentValue)"
        }
    }
    
    var currentDisplayValue: String = "0"
    
}
