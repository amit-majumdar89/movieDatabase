//
//  TMDBStore.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Foundation

public class TMDBStore {
    
    /// API KEY
    public static var apiKey: String {
        guard let key = Bundle.tmdbBundle.object(forInfoDictionaryKey: "APIKey") as? String else {
            fatalError("API key not found")
        }
        return key
    }
    
    /// API base url
    public static var baseURL: String {
        guard let baseURL = Bundle.tmdbBundle.object(forInfoDictionaryKey: "BaseURL") as? String else {
            fatalError("Base url not found")
        }
        return baseURL
    }
    
    /// Image URL
    public static var imageURL: String {
        guard let imageURL = Bundle.tmdbBundle.object(forInfoDictionaryKey: "ImageURL") as? String else {
            fatalError("Image url not found")
        }
        return imageURL
    }
    
    public static var pngImageURL: String {
        return imageURL + "w500/"
    }
}


extension Bundle {
    
    static var tmdbBundle: Bundle {
       Bundle(for: TMDBStore.self)
    }
}
