//
//  Logger.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 02/10/21.
//

import SwiftUI

extension View {
    
    func log(_ statement: String) -> some View {
        print(statement)
        return EmptyView()
    }
    
    func listSeparatorNone(backgroundColor: Color = Color(.systemBackground)) -> some View {
        self.modifier(ListSeparatorNone(backgroundColor: backgroundColor))
    }
}
