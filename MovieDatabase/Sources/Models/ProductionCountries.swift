//
//  ProductionCountries.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 27/09/21.
//

import Foundation

public struct ProductionCountries : Codable {
    public let iso : String?
    public let name : String?

    enum CodingKeys: String, CodingKey {

        case iso = "iso_3166_1"
        case name = "name"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iso = try values.decodeIfPresent(String.self, forKey: .iso)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

