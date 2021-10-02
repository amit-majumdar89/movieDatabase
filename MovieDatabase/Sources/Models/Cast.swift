//
//  Cast.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 02/10/21.
//

import Foundation

public struct Cast: Codable {
    
    public let adult : Bool?
    public let gender : Int?
    public let id: Int?
    public let knownDepartment : String?
    public let name : String?
    public let originalName : String?
    public let popularity : Double?
    public let profilePath : String?
    public let castId : Int?
    public let character : String?
    public let creditId : String?
    public let order : Int?

    public var actorName: String {
        get {
            if let name = name {
                return name
            } else if let originalName = originalName {
                return originalName
            } else {
                return ""
            }
        }
    }
    
    public var formattedIntroduction: String? {
        get {
            if let actorCharcter = character,
               !actorCharcter.isEmpty,
               !actorName.isEmpty {
                return "\(actorName.capitalized) featuring as \(actorCharcter.uppercased())"
            }
            return nil
        }
    }

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case order = "order"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        knownDepartment = try values.decodeIfPresent(String.self, forKey: .knownDepartment)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
        castId = try values.decodeIfPresent(Int.self, forKey: .castId)
        character = try values.decodeIfPresent(String.self, forKey: .character)
        creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
    }
}
