//
//  Rate.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

struct Rate: Codable, Hashable {

    let id: UUID = UUID()
    var base: String
    var date: String
    var rates: [String: Decimal]

    private enum CodingKeys: String, CodingKey {
        case base, date, rates
    }

}
