//
//  PagerView.swift
//  Novflix
//
//  Created by Tai Phan Van on 01/08/2021.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    
    @State private var verticalDragIsActive = false
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>

    var content: Content
    
    init(pageCount: Int,
         currentIndex: Binding<Int>,
         translation: Binding<CGFloat>,
         externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
         @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
        self.externalDragGesture = externalDragGesture
    }
    
    var body: some View {
        GeometryReader { geo in
            
            HStack(spacing: 0) {
                self.content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                externalDragGesture.simultaneously(
                    with:
                        DragGesture(minimumDistance: 20)
                        .onChanged({ value in
                            if verticalDragIsActive {
                                return
                            }
                            if abs(value.translation.width) < abs(value.translation.height) {
                                verticalDragIsActive = true
                                return
                            }
                            
                            // Horizontal drag only
                            translation = value.translation.width
                        })
                        .onEnded({ value in
                            
                            if verticalDragIsActive {
                                verticalDragIsActive = false
                                return
                            }
                            
                            // ending horizontal drag
                            let offset = value.translation.width / geo.size.width
                            let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
                            translation = .zero
                        })
                )
            )
        }
    }
}

//struct PagerDump: View {
//    
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
//    
//    var body: some View {
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//            Color.blue
//            Color.orange
//            Color.yellow
//        }
//    }
//}
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDump()
//    }
//}
