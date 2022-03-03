//
//  Date+Utils.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 22.02.2022.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "d MMMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
