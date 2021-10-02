//
//  MockResponseProvider.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Foundation

public protocol MockResponseProvider {
    func getMockJsonFile(for fileName: String) -> String
}


struct DefaultMockResponseProvider: MockResponseProvider {
    func getMockJsonFile(for fileName: String) -> String {
        return ""
    }
}
