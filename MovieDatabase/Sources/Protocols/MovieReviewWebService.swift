//
//  MovieReviewWebService.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 26/09/21.
//

import Foundation
import Combine

public protocol MovieReviewWebServiceProtocol: WebService {
    
    var baseURL: String { get }
        
    func fetchMovieReviews(with movieId: String, and pageNumber: Int) -> AnyPublisher<MovieReview, Error>
}

public struct MovieReviewWebService: MovieReviewWebServiceProtocol {
    
    public var baseURL = TMDBStore.baseURL
        
    enum EndPoints {
        case reviews(String, Int)
    }
   
    public init() { }
    
    public func fetchMovieReviews(with movieId: String, and pageNumber: Int) -> AnyPublisher<MovieReview, Error>{
        return requestAPI(with: EndPoints.reviews(movieId, pageNumber))
    }
}


extension MovieReviewWebService.EndPoints: URLRequestBuilder {
    
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .reviews(_, _):
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
        case .reviews(let movieID, let pageNumber):
            return APIEndPoint(path: "movie/\(movieID)/reviews?api_key=\(TMDBStore.apiKey)&language=en-US&page=\(pageNumber)", mockFileName: "Reviews")
        }
    }
    
    var queryParameters: [String: String?]? {
        return nil
    }
}
