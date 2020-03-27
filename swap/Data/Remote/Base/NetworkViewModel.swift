//
//  NetworkViewModel.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine

protocol NetworkViewModel: ObservableObject {
    
    associatedtype NetworkResource: Decodable
    
    var objectWillChange: ObservableObjectPublisher { get }
    var resource: Resource<NetworkResource> { get set }
    var network: Network { get set }
    var route: NetworkRoute { get }
    var bag: Set<AnyCancellable> { get set }
    
    func onAppear()
    
}

extension NetworkViewModel {
    
    func fetch(route: NetworkRoute) {
        (network.fetch(route: route) as AnyPublisher<NetworkResource, Error>)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.resource = .error(error)
                    self.objectWillChange.send()
                default:
                    break
                }
            }, receiveValue: { decodable in
                self.resource = .success(decodable)
                self.objectWillChange.send()
            })
            .store(in: &bag)
    }
    
    func onAppear() {
        fetch(route: route)
    }
    
}
