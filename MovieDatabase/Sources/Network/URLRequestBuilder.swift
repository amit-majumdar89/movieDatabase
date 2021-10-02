import Foundation

public protocol URLRequestBuilder {
    var endpoint: String { get }
    var httpMethod: String { get }
    var allHTTPHeaderFields: [String: String]? { get }
    var queryParameters: [String: String?]? { get }
    func httpBody() throws -> Data?
    
}

extension URLRequestBuilder {
    
    func urlRequest(for baseURL: String) throws -> URLRequest {
        // Final URL That will be created based on selected environment. Mock Or Real
        var finalURL: URL?
        // Check if selected environment is Mock
        if NetworkConfiguration.shared.currentEnvironment.isMock {
            guard let mockJSONPath = getPathForMockJSONFile(with: endpoint) else {
                throw NetworkError.invalidEndPoint
            }
            print("mockJSONPath is \(mockJSONPath)")
            // Mock URL is Set
            finalURL = URL(fileURLWithPath: mockJSONPath)
        } else {
            // Actual URL is Set
            let urlString = baseURL + endpoint
            print("urlString is \(urlString)")
            finalURL = URL(string: urlString)
        }
        guard var url = finalURL else {
            throw NetworkError.invalidEndPoint
        }
        if let queryItems = queryParameters {
            url.appenQueryItems(items: queryItems)
            print("urlString after appending query parameters is: \(url.absoluteString)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = allHTTPHeaderFields
        request.httpBody = try httpBody()
        return request
    }
    
    func getPathForMockJSONFile(with fileName: String) -> String? {
        JsonReader.shared.path(forResource: NetworkConfiguration.shared.mockResponseProvider.getMockJsonFile(for: fileName), ofType: "json")
    }
}
