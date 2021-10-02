import Foundation

public struct MovieListBaseModel : Codable {
    public let movieLists : [MovieListModel]?
    public let page : Int?
    public let total_results : Int?
    public let total_pages : Int?

    enum CodingKeys: String, CodingKey {
        case movieLists = "results"
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movieLists = try values.decodeIfPresent([MovieListModel].self, forKey: .movieLists)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
    }
}
