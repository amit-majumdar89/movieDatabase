//
//  String+DateFormatter.swift
//  MovieDatabase
//
//  Created by Amit Majumdar on 25/09/21.
//

import Foundation

public extension String {
    
    /// Date formate change
    func changeDateFormat(from currentDateFromat: DateFormat, to newDateFormat: DateFormat = .dispay) -> String? {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = currentDateFromat.rawValue
        if let convertDate = dateFormate.date(from: self) {
            dateFormate.dateFormat = newDateFormat.rawValue
            let returnDate = dateFormate.string(from: convertDate)
            return returnDate
        }
        return nil
    }
}
