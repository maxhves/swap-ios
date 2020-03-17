//
//  CurrencyDisplayDetail.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 17/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct CurrencyDisplayDetail: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("800009")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Norwegian Kroners")
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

struct CurrencyDisplayDetail_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDisplayDetail()
            .background(Color.backgroundAccent)
    }
}
