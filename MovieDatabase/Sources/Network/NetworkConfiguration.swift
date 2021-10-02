//
//  NetworkConfiguration.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Foundation

public class NetworkConfiguration {
    
    public static let shared = NetworkConfiguration()
    
    public enum Environment: Equatable {
        case real
        case mock(responseProvider: MockResponseProvider)
        
        public static func ==(lhs: NetworkConfiguration.Environment, rhs: NetworkConfiguration.Environment) -> Bool {
            switch (lhs, rhs) {
            case (.mock(_), .real), (real, .mock(_)):
                return false
            default:
                return true
            }
        }
        
        var isMock: Bool {
            self != .real
        }
    }
    
    private var _environment: Environment = .real
    
    private var _mockResponseProvider: MockResponseProvider = DefaultMockResponseProvider()
    
    var currentEnvironment: Environment {
        NetworkConfiguration.shared._environment
    }
    
    var mockResponseProvider: MockResponseProvider {
        NetworkConfiguration.shared._mockResponseProvider
    }
    
    public static func setConfiguration(for environment: Environment) {
        NetworkConfiguration.shared._environment = environment
        setMockResponseProvider(for: environment)
    }

    private static func setMockResponseProvider(for environment: Environment) {
        switch environment {
        case .real:
            break
        case .mock(let mockResponseProvider):
            NetworkConfiguration.shared._mockResponseProvider = mockResponseProvider
        }
    }
}





