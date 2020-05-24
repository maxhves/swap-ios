//
//  Currency.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 06/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

struct Currency: Identifiable {

    enum Continent {
        case Asia
        case Australia
        case Africa
        case Europe
        case NorthAmerica
        case SouthAmerica
    }

    struct CurrencySection: Identifiable {
        var id: String {
            title
        }
        var title: String
        var currencies: [Currency]
    }

    var id: String {
        name
    }
    var name: String
    var fullName: String
    var continent: Continent

    static let currencySections: [CurrencySection] = [
        CurrencySection(
                title: "Africa",
                currencies: currencies.filter({ currency in
                    currency.continent == .Africa
                })),
        CurrencySection(
                title: "Asia",
                currencies: currencies.filter({ currency in
                    currency.continent == .Asia
                })),
        CurrencySection(
                title: "Australia",
                currencies: currencies.filter({ currency in
                    currency.continent == .Australia
                })),
        CurrencySection(
                title: "Europe",
                currencies: currencies.filter({ currency in
                    currency.continent == .Europe
                })),
        CurrencySection(
                title: "North America",
                currencies: currencies.filter({ currency in
                    currency.continent == .NorthAmerica
                })),
        CurrencySection(
                title: "South America",
                currencies: currencies.filter({ currency in
                    currency.continent == .SouthAmerica
                }))
    ]

    // MARK: Full currency array
    static let currencies: Array<Currency> = [
        Currency(name: "ZAR", fullName: "South African Rand", continent: .Africa),
        Currency(name: "CNY", fullName: "Chinese Yuan", continent: .Asia),
        Currency(name: "HKD", fullName: "Hong Kong Dollars", continent: .Asia),
        Currency(name: "IDR", fullName: "Indonesian Rupiajh", continent: .Asia),
        Currency(name: "ILS", fullName: "Israeli New Shekel", continent: .Asia),
        Currency(name: "INR", fullName: "Indian Rupee", continent: .Asia),
        Currency(name: "JPY", fullName: "Japanese Yen", continent: .Asia),
        Currency(name: "KRW", fullName: "South Korean Won", continent: .Asia),
        Currency(name: "MYR", fullName: "Malaysian Ringgit", continent: .Asia),
        Currency(name: "PHP", fullName: "Philippine Peso", continent: .Asia),
        Currency(name: "SGD", fullName: "Singapore Dollar", continent: .Asia),
        Currency(name: "THB", fullName: "Thai Baht", continent: .Asia),
        Currency(name: "TRY", fullName: "Turkish Lira", continent: .Asia),
        Currency(name: "AUD", fullName: "Australian Dollars", continent: .Australia),
        Currency(name: "NZD", fullName: "New Zealand Dollars", continent: .Australia),
        Currency(name: "BGN", fullName: "Bulgarian Lev", continent: .Europe),
        Currency(name: "CHF", fullName: "Swiss Francs", continent: .Europe),
        Currency(name: "CZK", fullName: "Czech Koruna", continent: .Europe),
        Currency(name: "DKK", fullName: "Danish Kroner", continent: .Europe),
        Currency(name: "EUR", fullName: "Euros", continent: .Europe),
        Currency(name: "GBP", fullName: "Great British Pounds", continent: .Europe),
        Currency(name: "HRK", fullName: "Croatian Kuna", continent: .Europe),
        Currency(name: "HUF", fullName: "Hungarian Forint", continent: .Europe),
        Currency(name: "ISK", fullName: "Icelandic Kroner", continent: .Europe),
        Currency(name: "NOK", fullName: "Norwegian Kroner", continent: .Europe),
        Currency(name: "PLN", fullName: "Poland Zloty", continent: .Europe),
        Currency(name: "RON", fullName: "Romanian Leu", continent: .Europe),
        Currency(name: "RUB", fullName: "Russian Ruble", continent: .Europe),
        Currency(name: "SEK", fullName: "Swedish Kroner", continent: .Europe),
        Currency(name: "CAD", fullName: "Canadian Dollars", continent: .NorthAmerica),
        Currency(name: "USD", fullName: "United States Dollars", continent: .NorthAmerica),
        Currency(name: "BRL", fullName: "Brazilian Real", continent: .SouthAmerica),
        Currency(name: "MXN", fullName: "Mexican Peso", continent: .SouthAmerica)
    ]

}
