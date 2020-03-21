//
//  ExchangeRatesNetwork.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

struct ExchangeRatesNetwork: Network {
    
    var decoder: JSONDecoder = JSONDecoder()
    var environment: Environment = .exchange
    
}
