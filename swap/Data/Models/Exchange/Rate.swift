//
//  Rate.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

struct Rate: Codable {

    let base: String
    let date: String
    let rates: [String: Decimal]
    
}
