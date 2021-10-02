//
//  URL+QueryItems.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Foundation

public extension URL {

    mutating func appendQueryItem(name: String, value: String?) {

        guard var urlComponents = URLComponents(string: absoluteString) else { return }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: name, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        self = urlComponents.url!
    }
    
    mutating func appenQueryItems(items: [String: String?]) {
        items.forEach { (key, value) in
            appendQueryItem(name: key, value: value)
        }
    }
}
