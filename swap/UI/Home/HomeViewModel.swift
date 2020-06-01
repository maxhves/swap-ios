//
//  HomeViewModel.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 29/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {

    var cancellationToken: Set<AnyCancellable?> = []
    var fetchedRates: Set<Rate> = []
    @Published var error: Error? = nil
    @Published var ratesFetched: Bool = false

    init() {
        fetchCurrencyRates()
    }

}

extension HomeViewModel {

    private func fetchCurrencyRates() {
        Currency.currencies.forEach { currency in
            getLatestRateForBase(base: currency.name)
        }
    }

    private func getLatestRateForBase(base: String) {
        cancellationToken.insert(ExchangeRatesService.request(.latest, parameters: ["base": base])
                .mapError({ (error) -> Error in
                    self.error = error
                    return error
                })
                .sink(receiveCompletion: { _ in },
                        receiveValue: { rate in
                            self.fetchedRates.insert(rate)
                            print("Returned rate: \(rate)")

                            if self.fetchedRates.count >= Currency.currencies.count {
                                self.ratesFetched = true
                            }
                        }))
    }

}
