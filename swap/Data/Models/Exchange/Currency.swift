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
                title: "Africa".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Africa
                })),
        CurrencySection(
                title: "Asia".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Asia
                })),
        CurrencySection(
                title: "Australia".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Australia
                })),
        CurrencySection(
                title: "Europe".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Europe
                })),
        CurrencySection(
                title: "NorthAmerica".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .NorthAmerica
                })),
        CurrencySection(
                title: "SouthAmerica".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .SouthAmerica
                }))
    ]

    // MARK: Full currency array
    static let currencies: Array<Currency> = [
        Currency(name: "ZAR", fullName: "SouthAfricanRand".localized(), continent: .Africa),
        Currency(name: "CNY", fullName: "ChineseYuan".localized(), continent: .Asia),
        Currency(name: "HKD", fullName: "HongKongDollars".localized(), continent: .Asia),
        Currency(name: "IDR", fullName: "IndonesianRupiajh".localized(), continent: .Asia),
        Currency(name: "ILS", fullName: "IsraeliNewShekel".localized(), continent: .Asia),
        Currency(name: "INR", fullName: "IndianRupee".localized(), continent: .Asia),
        Currency(name: "JPY", fullName: "JapaneseYen".localized(), continent: .Asia),
        Currency(name: "KRW", fullName: "SouthKoreanWon".localized(), continent: .Asia),
        Currency(name: "MYR", fullName: "MalaysianRinggit".localized(), continent: .Asia),
        Currency(name: "PHP", fullName: "PhilippinePeso".localized(), continent: .Asia),
        Currency(name: "SGD", fullName: "SingaporeDollar".localized(), continent: .Asia),
        Currency(name: "THB", fullName: "ThaiBaht".localized(), continent: .Asia),
        Currency(name: "TRY", fullName: "TurkishLira".localized(), continent: .Asia),
        Currency(name: "AUD", fullName: "AustralianDollars".localized(), continent: .Australia),
        Currency(name: "NZD", fullName: "NewZealandDollars".localized(), continent: .Australia),
        Currency(name: "BGN", fullName: "BulgarianLev".localized(), continent: .Europe),
        Currency(name: "CHF", fullName: "SwissFrancs".localized(), continent: .Europe),
        Currency(name: "CZK", fullName: "CzechKoruna".localized(), continent: .Europe),
        Currency(name: "DKK", fullName: "DanishKroner".localized(), continent: .Europe),
        Currency(name: "EUR", fullName: "Euros".localized(), continent: .Europe),
        Currency(name: "GBP", fullName: "GreatBritishPounds".localized(), continent: .Europe),
        Currency(name: "HRK", fullName: "CroatianKuna".localized(), continent: .Europe),
        Currency(name: "HUF", fullName: "HungarianForint".localized(), continent: .Europe),
        Currency(name: "ISK", fullName: "IcelandicKroner".localized(), continent: .Europe),
        Currency(name: "NOK", fullName: "NorwegianKroner".localized(), continent: .Europe),
        Currency(name: "PLN", fullName: "PolishZloty".localized(), continent: .Europe),
        Currency(name: "RON", fullName: "RomanianLeu".localized(), continent: .Europe),
        Currency(name: "RUB", fullName: "RussianRuble".localized(), continent: .Europe),
        Currency(name: "SEK", fullName: "SwedishKroner".localized(), continent: .Europe),
        Currency(name: "CAD", fullName: "CanadianDollars".localized(), continent: .NorthAmerica),
        Currency(name: "USD", fullName: "UnitedStatesDollars".localized(), continent: .NorthAmerica),
        Currency(name: "BRL", fullName: "BrazilianReal".localized(), continent: .SouthAmerica),
        Currency(name: "MXN", fullName: "MexicanPeso".localized(), continent: .SouthAmerica)
    ]

}
