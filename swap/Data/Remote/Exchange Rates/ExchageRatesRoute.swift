//
//  ExchageRatesRoute.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

enum ExchangeRatesRoute {
    
    case rate
    
}

extension ExchangeRatesRoute: NetworkRoute {
    
    var path: String {
        switch self {
        case .rate:
            return "/latest"
        }
    }
    
    var method: Method {
        switch self {
        case .rate:
            return .get
        }
    }
    
}
