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
    @GestureState private var translation: CGFloat = 0
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = 0
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: ViewConstants.large)
            .fill(Color.white)
            .frame(width: ViewConstants.indicatorWidth, height: ViewConstants.indicatorHeight)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                self.indicator.padding()
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color.black)
            .cornerRadius(ViewConstants.regular)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * 0.5
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
            
        }
        
    }
    
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isOpen: .constant(true), maxHeight: 350) {
            Text("Bottom Sheet View")
                .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
