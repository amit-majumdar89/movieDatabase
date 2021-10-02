import Foundation

public struct MovieListModel : Codable, Identifiable {
    public let id : Int?
    public let poster_path : String?
    public let backdrop_path : String?
    public let original_title : String?
    public let title : String?
    public let overview : String?
    public let release_date : String?
    public let productionCompnies: [ProductionCompanies]?
    
    public var displayTitle: String {
        get {
            if let title = title {
                return title
            } else if let original_title = original_title {
                return original_title
            } else {
                return ""
            }
        }
    }
    
    public var displayDate : String? {
        get {
            let date = release_date?.changeDateFormat(from: .server)
            return date
        }
    }
    
    
    enum CodingKeys: String, CodingKey {
        case poster_path = "poster_path"
        case id = "id"
        case backdrop_path = "backdrop_path"
        case original_title = "original_title"
        case title = "title"
        case overview = "overview"
        case release_date = "release_date"
        case productionCompnies = "production_companies"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        productionCompnies = try values.decodeIfPresent([ProductionCompanies].self, forKey: .productionCompnies)
    }
}
