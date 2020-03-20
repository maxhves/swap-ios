//
//  NetworkRoute.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 20/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

protocol NetworkRoute {
    
    var path: String { get }
    var method: Method { get }
    var headers: [String: String]? { get }
    
}

extension NetworkRoute {
    
    var headers: [String: String]? {
        return nil
    }
    
    func create() {
        
    }
    
}
