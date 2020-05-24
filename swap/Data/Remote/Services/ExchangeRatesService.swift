//
// Created by Maximilian Hvesser-Lewis on 23/05/2020.
// Copyright (c) 2020 Hvesser. All rights reserved.
//

import Foundation
import Combine

enum ExchangeRatesService {
    static let apiClient = ApiClient()
    static let baseUrl = URL(string: "https://api.exchangeratesapi.io")!
}

enum ApiPath: String {
    case latest = "/latest"
}

extension ExchangeRatesService {

    static func request(_ path: ApiPath, parameters: [String: String]? = nil) -> AnyPublisher<Rate, Error> {

        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                else { fatalError("Couldn't create URLComponents") }

        if let parameters = parameters {
            components.queryItems = parameters.map { key, value -> URLQueryItem in
                return URLQueryItem(name: key, value: value)
            }
        }

        let request = URLRequest(url: components.url!)

        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()

    }

}