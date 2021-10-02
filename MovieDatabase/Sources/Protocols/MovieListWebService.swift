import Combine

public protocol MovieListWebServiceProtocol: WebService {
    var baseURL: String { get }
    func fetchNowPlayingMovies(pageNum: Int) -> AnyPublisher<MovieListBaseModel, Error>
}

public struct MovieListWebService: MovieListWebServiceProtocol {
    
    static var pageCount: Int = 0
    public var baseURL = TMDBStore.baseURL
        
    enum EndPoints {
        case nowPlaying(Int)
    }
   
    public init() { }
    
    public func fetchNowPlayingMovies(pageNum: Int) -> AnyPublisher<MovieListBaseModel, Error> {
        return requestAPI(with: EndPoints.nowPlaying(pageNum))
    }
}


extension MovieListWebService.EndPoints: URLRequestBuilder {
   
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .nowPlaying:
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
        case .nowPlaying(let pageNum):
            return APIEndPoint(path: "movie/now_playing?api_key=\(TMDBStore.apiKey)&language=en-US&page=\(pageNum)", mockFileName: "MovieList")
        }
    }
    
    var queryParameters: [String : String?]? {
        return nil
    }
}
