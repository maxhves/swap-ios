//
// Created by Maximilian Hvesser-Lewis on 02/06/2020.
// Copyright (c) 2020 Hvesser. All rights reserved.
//

import Foundation

extension String {

    ////
    /// Returns a localised version for given string
    /// - Parameter comment:
    /// - Returns:
    func localized(withComment comment: String? = nil) -> String {
        NSLocalizedString(self, comment: comment ?? "")
    }

}