//
//  SimilarMovie.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 02/10/21.
//

import Foundation

public struct SimilarMovie: Codable {
    
    public let adult : Bool?
    public let backdropPath : String?
    public let genreIds: [Int]?
    public let id: Int?
    public let title : String?
    public let originalLanguage : String?
    public let originalTitle : String?
    public let overview : String?
    public let popularity : Double?
    public let posterPath : String?
    public let releaseDate : String?
    public let video : Bool?
    public let voteAverage : Double?
    public let voteCount : Int?

    public var displayTitle: String {
        get {
            if let title = title {
                return title
            } else if let originalTitle = originalTitle {
                return originalTitle
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
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case title = "title"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
}
