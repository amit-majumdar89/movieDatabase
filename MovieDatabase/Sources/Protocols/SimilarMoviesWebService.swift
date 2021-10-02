//
//  SimilarMoviesWebService.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 02/10/21.
//

import Combine

public protocol SimilarMoviesWebServiceProtocol: WebService {
    
    var baseURL: String { get }
    
    func fetchSimilarMovies(for movieID: Int, in page: Int) -> AnyPublisher<SimilarMoviesParent, Error>
}

public struct SimilarMoviesWebService: SimilarMoviesWebServiceProtocol {
    
    public var baseURL = TMDBStore.baseURL
        
    enum EndPoints {
        case similar(Int, Int)
    }
   
    public init() { }
    
    public func fetchSimilarMovies(for movieID: Int, in page: Int) -> AnyPublisher<SimilarMoviesParent, Error> {
        return requestAPI(with: EndPoints.similar(movieID, page))
    }
}


extension SimilarMoviesWebService.EndPoints: URLRequestBuilder {
   
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .similar(_ , _):
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
        case .similar(let movieID, let pageNumber):
            let path = "movie/\(movieID)/similar?api_key=\(TMDBStore.apiKey)&language=en-US&page=\(pageNumber)"
            return APIEndPoint(path: path, mockFileName: "SimilarMovies")
        }
    }
    
    var queryParameters: [String : String?]? {
        return nil
    }
}
