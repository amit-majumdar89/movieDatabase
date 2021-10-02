import Foundation

public struct ProductionCompanies : Codable {
    public let id : Int?
    public let logo_path : String?
    public let name : String?
    public let origin_country : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case logo_path = "logo_path"
        case name = "name"
        case origin_country = "origin_country"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        logo_path = try values.decodeIfPresent(String.self, forKey: .logo_path)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        origin_country = try values.decodeIfPresent(String.self, forKey: .origin_country)
    }
}
