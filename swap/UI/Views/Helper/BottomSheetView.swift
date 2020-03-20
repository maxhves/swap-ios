//
//  BottomSheetView.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 17/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    
    @Binding var isOpen: Bool
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * ViewConstants.sheetMinHeightFactor
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: ViewConstants.large)
            .fill(Color.black)
            .frame(width: ViewConstants.indicatorWidth, height: ViewConstants.indicatorHeight)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                self.indicator.padding()
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color.blue)
            .cornerRadius(ViewConstants.large)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: self.offset)
            
        }
        
    }
    
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isOpen: .constant(true), maxHeight: 250) {
            Text("Bottom Sheet View")
        }
        .edgesIgnoringSafeArea(.all)
    }
}
