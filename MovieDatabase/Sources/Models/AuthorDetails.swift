//
//  AuthorDetails.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 27/09/21.
//

import Foundation

public struct AuthorDetails: Codable {
   
    public let name : String?
    public let username : String?
    public let avatar : String?
    public let rating : Int?
    
    enum CodingKeys: String, CodingKey {
      case name = "name"
      case username = "username"
      case avatar = "avatar_path"
      case rating = "rating"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
    }
}
