//
//  Extensions+String.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/25/24.
//

import SwiftUI

extension String {
    
    static let placeholderName = String(
        localized: LocalizationValue("placeholderName")
    )
    
    static let placeholderPhone = String(
        localized: LocalizationValue("placeholderPhone")
    )
    
    static let appGroupIdentifier = "group.wbapp.com"
    
    static let firstContactKey = "firstContact"

    static func getInitials(from fullName: String) -> String {
        let components = fullName.split(separator: " ")
        
        guard components.count > 1 else { return "" }
        
        let firstNameInitial = components[0].first ?? Character("")
        let lastNameInitial = components[1].first ?? Character("")
        
        return "\(firstNameInitial)\(lastNameInitial)"
    }
}

extension LocalizedStringKey {
    
    static let buttonText = LocalizedStringKey("buttonText")
}


