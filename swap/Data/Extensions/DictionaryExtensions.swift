//
//  DictionaryExtensions.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 21/05/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import Foundation

extension Dictionary {
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        return output
    }
}
