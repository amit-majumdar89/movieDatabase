//
//  Reviews.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 27/09/21.
//

import Foundation

public struct Reviews: Codable {
    
    public let id : String?
    public let author : String?
    public let authorDetails: AuthorDetails?
    public let content : String?
    public let createdAt : String?
    public let updatedAt : String?
    public let url : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case authorDetails = "author_details"
        case content = "content"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case url = "url"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        authorDetails = try values.decodeIfPresent(AuthorDetails.self, forKey: .authorDetails)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
