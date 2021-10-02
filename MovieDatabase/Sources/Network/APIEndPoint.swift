//
//  APIEndPoint.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Foundation

public struct APIEndPoint {
   
    public let path: String
    public let mockFileName: String
    
    public init(path: String, mockFileName: String) {
        self.path = path
        self.mockFileName = mockFileName
    }
}
