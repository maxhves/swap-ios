//
//  HomeViewModel.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 29/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: NetworkViewModel, ObservableObject {
    
    typealias NetworkResource = Rate
    
    // MARK: Properties
    var resource: Resource<NetworkResource> = .loading
    var network: Network
    var route: NetworkRoute = ExchangeRatesRoute.rate
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    // MARK: Init
    init(with network: Network) {
        self.network = network
    }
    
}
