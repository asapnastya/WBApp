//
//  Extension+String.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/5/24.
//

import SwiftUI

extension String.StringInterpolation {
    
    mutating func appendInterpolation(date: Date, locale: Locale) {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.numberStyle = .spellOut
        
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [
                .minute,
                .hour,
                .day,
                .month,
                .year
            ],
            from: date
        )
        
        guard let minute = components.minute,
              let hour = components.hour,
              let day = components.day,
              let month = components.month,
              let year = components.year 
        else {
            appendLiteral("Ошибка")
            return
        }
        
        let minuteString = numberFormatter.string(from: NSNumber(value: minute)) ?? ""
        let hourString = numberFormatter.string(from: NSNumber(value: hour)) ?? ""
        let dayString = numberFormatter.string(from: NSNumber(value: day)) ?? ""
        let monthString = numberFormatter.string(from: NSNumber(value: month)) ?? ""
        let yearString = numberFormatter.string(from: NSNumber(value: year)) ?? ""
        
        let formattedDateString = "\(dayString), \(monthString), \(yearString)\nВремя: \(hourString) \(minuteString)"
        appendLiteral(formattedDateString)
    }
}
