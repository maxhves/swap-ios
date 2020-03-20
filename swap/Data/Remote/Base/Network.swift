//
//  Network.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 20/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine

protocol Network {
    
    var decoder: JSONDecoder { get set }
    var environment: Environment { get set }
    
}

extension Network {
    
    func fetch<T: Decodable>(route: NetworkRoute) -> AnyPublisher<T, Error> {
        let request = route.create(for: environment)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryCompactMap { result in
                try self.decoder.decode(T.self, from: result.data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
