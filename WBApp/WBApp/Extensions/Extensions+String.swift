//
//  Extension+String.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/16/24.
//

import SwiftUI

extension String {
    
    static let privacyPolicy = String(
        localized: LocalizationValue("privacyPolicy")
    )
    
    static let termsOfUse = String(
        localized: LocalizationValue("termsOfUse")
    )
    
    static let agreementText = String(
        localized: LocalizationValue("agreementText")
    )
    
    static let unknownErrorTitle = String(
        localized: LocalizationValue("unknownErrorTitle")
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
    
    func formatPhoneNumber() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = "XXX XXX-XX-XX"
        
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        return result
    }
}

extension LocalizedStringKey {
    
    static let onboardingTitle = LocalizedStringKey("onboardingTitle")
    static let dismissButtonTitle = LocalizedStringKey("dismissTitle")
    static let startChatButtonTitle = LocalizedStringKey("startChatTitle")
    static let contactsTitle = LocalizedStringKey("contactsTitle")
    static let searchBarTitle = LocalizedStringKey("searchBarTitle")
    static let enterPhoneNumberTitle = LocalizedStringKey("enterPhoneNumberTitle")
    static let enterPhoneNumberSubtitle = LocalizedStringKey("enterPhoneNumberSubtitle")
    static let continueTitle = LocalizedStringKey("continueTitle")
    static let ruPhoneCodeTitle = LocalizedStringKey("ruPhoneCodeTitle")
    static let ruPhoneMaskDefaultTitle = LocalizedStringKey("ruPhoneMaskDefaultTitle")
    static let enterConfirmationCodeTitle = LocalizedStringKey("enterConfirmationCodeTitle")
    static let enterConfirmationCodeSubtitle = LocalizedStringKey("enterConfirmationCodeSubtitle")
    static let resendConfirmationCodeTitle = LocalizedStringKey("resendConfirmationCodeTitle")
}
