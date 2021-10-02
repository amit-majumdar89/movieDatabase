//
//  WebService.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Combine
import Foundation

public protocol WebService {
    var baseURL: String { get }
}

public extension WebService {
    
    var session: URLSession {
        return .shared
    }
    
    func requestAPI<Value>(with requestBuilder: URLRequestBuilder, httpCodes: HTTPCodes = .success) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try requestBuilder.urlRequest(for: baseURL)
            return session
                .dataTaskPublisher(for: request)
                .decodeResponse(httpCodes: httpCodes)
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
    
    func requestAPI(with requestBuilder: URLRequestBuilder, httpCodes: HTTPCodes = .success) -> AnyPublisher<Void, Error> {
        do {
            let request = try requestBuilder.urlRequest(for: baseURL)
            return session
                .dataTaskPublisher(for: request)
                .tryMap {
                    if NetworkConfiguration.shared.currentEnvironment.isMock {
                        return Void()
                    }
                    guard let code = ($0.1 as? HTTPURLResponse)?.statusCode else {
                        throw NetworkError.unexpectedResponse
                    }
                    guard httpCodes.contains(code) else {
                        throw NetworkError.apiError(code)
                    }
                    return Void()
                }
                .extractUnderlyingError()
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
            
        } catch let error {
            return Fail<Void, Error>(error: error).eraseToAnyPublisher()
        }
    }
}

