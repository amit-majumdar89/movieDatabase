//
//  Crew.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 02/10/21.
//

import Foundation

public struct Crew: Codable {
    
    public let adult : Bool?
    public let gender : Int?
    public let id: Int?
    public let knownDepartment : String?
    public let name : String?
    public let originalName : String?
    public let popularity : Double?
    public let profilePath : String?
    public let creditId : String?
    public let department : String?
    public let job : String?

    public var crewName: String {
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
    
    public var departmentName: String {
        get {
            if let department = department {
                return department
            } else if let knownDepartment = knownDepartment {
                return knownDepartment
            } else {
                return ""
            }
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
        case creditId = "credit_id"
        case department = "department"
        case job = "job"
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
        creditId = try values.decodeIfPresent(String.self, forKey: .creditId)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        job = try values.decodeIfPresent(String.self, forKey: .job)
    }
}
