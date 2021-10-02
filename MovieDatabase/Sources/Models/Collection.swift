//
//  Collection.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 27/09/21.
//

import Foundation

public struct Collection: Codable {
   
    public let id : Int?
    public let name : String?
    public let posterPath : String?
    public let backdropPath : String?
    
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
    }
}

