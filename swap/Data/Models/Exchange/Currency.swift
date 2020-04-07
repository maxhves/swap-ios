//
//  Currency.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 06/04/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

struct Currency : Identifiable {
    
    struct CurrencySection : Identifiable {
        var id: String { title }
        var title: String
        var currencies: [Currency]
    }
    
    var id: String { name }
    var name: String
    var fullName: String
    
    static func provideCurrencyList() -> [CurrencySection] {
        return [
            provideAfricanCurrencies(),
            provideAsianCurrencies(),
            provideAustralianCurrencies(),
            provideEuropeanCurrencies(),
            provideNorthAmericanCurrencies(),
            provideSouthAmericanCurrencies()
        ]
    }
    
    private static func provideAfricanCurrencies() -> CurrencySection {
        return CurrencySection(
            title: "Africa",
            currencies: [
                Currency(name: "ZAR", fullName: "South African Rand")
            ]
        )
    }
    
    private static func provideAsianCurrencies() -> CurrencySection {
        return CurrencySection(
            title: "Asia",
            currencies: [
                Currency(name: "CNY", fullName: "Chinese Yuan"),
                Currency(name: "HKD", fullName: "Hong Kong Dollars"),
                Currency(name: "IDR", fullName: "Indonesian Rupiajh"),
                Currency(name: "ILS", fullName: "Israeli New Shekel"),
                Currency(name: "INR", fullName: "Indian Rupee"),
                Currency(name: "JPY", fullName: "Japanese Yen"),
                Currency(name: "KRW", fullName: "South Korean Won"),
                Currency(name: "MYR", fullName: "Malaysian Ringgit"),
                Currency(name: "PHP", fullName: "Philippine Peso"),
                Currency(name: "RUB", fullName: "Russian Ruble"),
                Currency(name: "SGD", fullName: "Singapore Dollar"),
                Currency(name: "THB", fullName: "Thai Baht"),
                Currency(name: "TRY", fullName: "Turkish Lira")
            ]
        )
    }

    private static func provideAustralianCurrencies() -> CurrencySection {
        return CurrencySection(
            title: "Australia",
            currencies: [
                Currency(name: "AUD", fullName: "Australian Dollars"),
                Currency(name: "NZD", fullName: "New Zealand Dollars")
            ]
        )
    }

    private static func provideEuropeanCurrencies() -> CurrencySection {
        return CurrencySection(
            title: "Europe",
            currencies: [
                Currency(name: "BGN", fullName: "Bulgarian Lev"),
                Currency(name: "CHF", fullName: "Swiss Francs"),
                Currency(name: "CZK", fullName: "Czech Koruna"),
                Currency(name: "DKK", fullName: "Danish Kroner"),
                Currency(name: "EUR", fullName: "Euros"),
                Currency(name: "GBP", fullName: "Great British Pounds"),
                Currency(name: "HRK", fullName: "Croatian Kuna"),
                Currency(name: "HUF", fullName: "Hungarian Forint"),
                Currency(name: "ISK", fullName: "Icelandic Kroner"),
                Currency(name: "NOK", fullName: "Norwegian Kroner"),
                Currency(name: "PLN", fullName: "Poland Zloty"),
                Currency(name: "RON", fullName: "Romanian Leu"),
                Currency(name: "RUB", fullName: "Russian Ruble"),
                Currency(name: "SEK", fullName: "Swedish Kroner"),
                Currency(name: "TRY", fullName: "Turkish Lira")
            ]
        )
    }

    private static func provideNorthAmericanCurrencies() -> CurrencySection {
        return CurrencySection(
            title: "North America",
            currencies: [
                Currency(name: "CAD", fullName: "Canadian Dollars"),
                Currency(name: "USD", fullName: "United States Dollars")
            ]
        )
    }

    private static func provideSouthAmericanCurrencies() -> CurrencySection {
        return CurrencySection(
            title: "South America",
            currencies: [
                Currency(name: "BRL", fullName: "Brazilian Real"),
                Currency(name: "MXN", fullName: "Mexican Peso")
            ]
        )
    }
    
}
