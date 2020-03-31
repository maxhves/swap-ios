//
//  ExchangeDisplayDetail.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 31/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct ExchangeDisplayDetail: View {
    let value: String
    let name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(value)")
                .font(.system(
                    size: ViewConstants.primaryDisplaySize,
                    weight: .semibold,
                    design: .rounded)
                )
                .foregroundColor(Color.textBody)
            Text("\(name)")
                .font(.system(
                    size: ViewConstants.primaryDisplayNameSize,
                    weight: .semibold,
                    design: .rounded)
                )
                .foregroundColor(Color.textBody)
        }
        .padding(ViewConstants.large)
    }
}

struct ExchangeDisplayDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplayDetail(value: "0", name: "Norwegian Kroners")
    }
}
