//
//  BottomPopupView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 11/10/23.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        content()
    }
}
