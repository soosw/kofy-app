//
//  PopupModifier.swift
//  Kofy
//
//  Created by Diego Gutierrez on 11/10/23.
//

import SwiftUI

struct OverlayModifier<OverlayView: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let overlayView: OverlayView
    
    init(isPresented: Binding<Bool>, @ViewBuilder overlayView: @escaping () -> OverlayView) {
        self._isPresented = isPresented
        self.overlayView = overlayView()
    }
    
    func body(content: Content) -> some View {
        let offsetValue: CGFloat = isPresented ? 0 : UIScreen.main.bounds.size.height
        
        return content.overlay(
            overlayView
                .offset(y: offsetValue)
                .animation(.easeInOut, value: isPresented)
        )
    }
}

extension View {
    func popup<OverlayView: View>(isPresented: Binding<Bool>,
                                  blurRadius: CGFloat = 3,
                                  blurAnimation: Animation? = .linear,
                                  @ViewBuilder overlayView: @escaping () -> OverlayView) -> some View {
        
        return blur(radius: isPresented.wrappedValue ? blurRadius : 0)
            .animation(blurAnimation, value: isPresented.wrappedValue)
            .allowsHitTesting(!isPresented.wrappedValue)
            .modifier(OverlayModifier(isPresented: isPresented, overlayView: overlayView))
    }
}
