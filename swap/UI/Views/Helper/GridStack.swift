//
//  GridStack.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 17/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< rows, id:\.self) { row in
                HStack(spacing: 0) {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 3, columns: 3, content: { _, _ in
            Text("Grid")
        })
    }
}
