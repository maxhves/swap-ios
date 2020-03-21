//
//  HomeViewModel.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: NetworkViewModel, ObservableObject {
    
    typealias NetworkResource = Rate
    
    var resource: Resource<NetworkResource> = .loading
    var network: Network
    var route: NetworkRoute = ExchangeRatesRoute.rate
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(with network: Network) {
        self.network = network
    }
    
}
