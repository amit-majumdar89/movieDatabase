import Foundation

public struct Credits: Codable {
    
    public let id : Int?
    public let cast : [Cast]?
    public let crew: [Crew]?
  
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
        case crew = "crew"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        cast = try values.decodeIfPresent([Cast].self, forKey: .cast)
        crew = try values.decodeIfPresent([Crew].self, forKey: .crew)
    }
}
