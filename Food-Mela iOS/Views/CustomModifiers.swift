//
//  CustomModifiers.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 26/3/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View{
    func standardButtonStyle()-> some View {
        self.modifier(StandardButtonStyle())
    }
}
