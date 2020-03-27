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
    
    // TODO: Fix force unwrapping - not nice 🚫
    func create(for environment: Environment) -> URLRequest {
        var request = URLRequest(url: URL(string: environment.rawValue + path)!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()
        
        return request
    }
    
}
