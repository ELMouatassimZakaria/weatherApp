//
//  FormatterDateHelper.swift
//  WeatherApp
//
//  Created by Zakaria El Mouatassim on 24/06/2023.
//

import Foundation

enum DateFormat: String {
    case long = "yyyy-MM-dd HH:mm:ss"
    case hourOnly = "HH'h'"
}

class DateFormatterHelper {
    static func formatDateString(_ dateString: String, fromFormat: DateFormat, toFormat: DateFormat) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat.rawValue

        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = toFormat.rawValue
            return dateFormatter.string(from: date)
        }

        return nil
    }
}
