import Combine

public protocol MovieDetailsWebServiceProtocol: WebService {
    
    var baseURL: String { get }
    
    func fetchMovieDetail(id: String) -> AnyPublisher<MovieDetail, Error>
}

public struct MovieDetailsWebService: MovieDetailsWebServiceProtocol {
    
    public var baseURL = TMDBStore.baseURL
        
    enum EndPoints {
        case movieDetail(String)
    }
   
    public init() { }
    
    public func fetchMovieDetail(id: String) -> AnyPublisher<MovieDetail, Error> {
        return requestAPI(with: EndPoints.movieDetail(id))
    }
}


extension MovieDetailsWebService.EndPoints: URLRequestBuilder {
   
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .movieDetail(_):
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
        case .movieDetail(let movieID):
            return APIEndPoint(path: "movie/\(movieID)?api_key=\(TMDBStore.apiKey)", mockFileName: "MovieDetail")
        }
    }
    
    var queryParameters: [String: String?]? {
        switch self {
        case .movieDetail(_):
            return ["language" : "en-US"]
        }
    }
    
}
