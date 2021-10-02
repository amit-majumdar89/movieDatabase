//
//  CardModifier.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 25/09/21.
//

import SwiftUI

struct CardModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}


struct ListSeparatorNone: ViewModifier {

    var backgroundColor: Color = Color(.systemBackground)
    
    func body(content: Content) -> some View {
        content
            .listRowInsets(EdgeInsets(top: -1, leading: 0, bottom: 0, trailing: 0))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(backgroundColor)
    }
}
