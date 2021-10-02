import Foundation

public struct MovieReview: Codable {
   
    public let id : Int?
    public let page : Int?
    public let results : [Reviews]?
    public let totalPages : Int?
    public let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
      case id = "id"
      case page = "page"
      case results = "results"
      case totalPages = "total_pages"
      case totalResults = "total_results"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([Reviews].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}
