import Foundation

public struct MovieDetail: Codable {
   
    public let adult : Bool?
    public let backdrop_path : String?
    public let belongsToCollection : Collection?
    public let budget : Int?
    public let homepage : String?
    public let id : Int?
    public let imdb_id : String?
    public let original_language : String?
    public let original_title : String?
    public let overview : String?
    public let popularity : Double?
    public let poster_path : String?
    public let productionCompnies: [ProductionCompanies]?
    public let genres: [Genres]?
    public let productionCountries: [ProductionCountries]?
    public let releaseDate : String?
    public let status : String?
    public let tagline : String?
    public let title: String?
    
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
            let date = releaseDate?.changeDateFormat(from: .server)
            return date
        }
    }
    
    public var genresInfo: String? {
        get {
            var str = ""
            genres?.forEach({ (genre) in
                if let genreCategory = genre.name {
                    str = genres?.count == 1 ? "\(genreCategory)" : str + "\(genreCategory), "
                }
            })
            if let safeGernres = genres {
                if safeGernres.count > 1 {
                    str = String(str.trimmingCharacters(in: .whitespacesAndNewlines).dropLast())
                }
            }
            return str.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case poster_path = "poster_path"
        case id = "id"
        case budget = "budget"
        case homepage = "homepage"
        case imdb_id = "imdb_id"
        case belongsToCollection = "belongs_to_collection"
        case original_title = "original_title"
        case original_language = "original_language"
        case overview = "overview"
        case popularity = "popularity"
        case productionCompnies = "production_companies"
        case genres = "genres"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case status = "status"
        case tagline = "tagline"
        case title = "title"

    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        imdb_id = try values.decodeIfPresent(String.self, forKey: .imdb_id)
        belongsToCollection = try values.decodeIfPresent(Collection.self, forKey: .belongsToCollection)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        productionCompnies = try values.decodeIfPresent([ProductionCompanies].self, forKey: .productionCompnies)
        genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
        productionCountries = try values.decodeIfPresent([ProductionCountries].self, forKey: .productionCountries)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}

