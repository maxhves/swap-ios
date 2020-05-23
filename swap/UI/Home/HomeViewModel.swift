//
//  HomeViewModel.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 29/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {

    var cancellationToken: AnyCancellable?

    init() {
        getLatestRate()
    }

}

extension HomeViewModel {

    private func getLatestRate() {
        cancellationToken = ExchangeRatesService.request(.latest)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                receiveValue: { rate in
                    let test = rate
                    print("Returned rate: \(rate)")
                })
    }

}
