//
//  DropShadowModifier.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 02/10/21.
//

import SwiftUI

public struct DropShadowModifier: ViewModifier {
    
    public let cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = 30.0) {
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        content
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 40)
            .overlay(
             RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.gray, lineWidth: 0.5)
             )
            .padding()
    }
    
}

