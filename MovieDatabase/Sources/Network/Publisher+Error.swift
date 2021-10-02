//
//  Publisher+Error.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Combine

extension Publisher {
    func extractUnderlyingError() -> Publishers.MapError<Self, Failure> {
        mapError {
            ($0.underlyingError as? Failure) ?? $0
        }
    }
}
