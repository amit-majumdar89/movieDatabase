//
//  MovieCreditsWebService.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 02/10/21.
//

import Combine

public protocol MovieCreditsWebServiceProtocol: WebService {
    
    var baseURL: String { get }
    
    func fetchCredits(for movieID: Int) -> AnyPublisher<Credits, Error>
}

public struct MovieCreditsWebService: MovieCreditsWebServiceProtocol {
    
    public var baseURL = TMDBStore.baseURL
        
    enum EndPoints {
        case credits(Int)
    }
   
    public init() { }
    
    public func fetchCredits(for movieID: Int) -> AnyPublisher<Credits, Error> {
        return requestAPI(with: EndPoints.credits(movieID))
    }
}


extension MovieCreditsWebService.EndPoints: URLRequestBuilder {
   
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .credits(_):
            return "GET"
        }
    }
    
    var allHTTPHeaderFields: [String : String]? {
        return nil
    }
    
    func httpBody() throws -> Data? {
        return nil
    }
    
    var endPointDetail: APIEndPoint {
        switch self {
        case .credits(let movieID):
            return APIEndPoint(path: "movie/\(movieID)/credits?api_key=\(TMDBStore.apiKey)",
                               mockFileName: "MovieCredits")
        }
    }
    
    var queryParameters: [String : String?]? {
        switch self {
        case .credits(_):
            return ["language" : "en-US"]
        }
    }
}
