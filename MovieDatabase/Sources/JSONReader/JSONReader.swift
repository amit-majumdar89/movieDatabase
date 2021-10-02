import Foundation

public class JsonReader: NSObject {
    
    public static var shared: JsonReader = JsonReader()
    
    private override init() {
        
    }
    
    /// Function to get the path of resources available in Bundle.
    ///
    /// - Parameters:
    ///   - resource: Name of the resource file
    ///   - type    : Type of the resource file
    ///   - bundle  : Bundle containing the resource, Defaults to Main App Bundle
    /// - Returns   : Path for resource
    public func path(forResource resource: String, ofType type: String, from bundle: Bundle = Bundle.main) -> String? {
        let path = bundle.path(forResource: resource, ofType: type)
        return path
    }

    /// Function to get generic json model
    /// - Parameters:
    ///   - fileName: file name stored in local
    ///   - type: model type
    /// - Returns: model object
    public func fetchJSONData<T: Decodable>(fileName: String, type: T.Type) -> T? {
        let filePath = path(forResource: fileName, ofType: "json", from: Bundle.main)
        if let path = filePath {
            do {
                let resultData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let model = try JSONDecoder().decode(T.self,
                                                     from: resultData)
                return model
            } catch {
                print("Error is:: \(error.localizedDescription)")
            }
        }
        return nil
    }

}
