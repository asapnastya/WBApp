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
    
}

extension LocalizedStringKey {
    
    static let onboardingTitle = LocalizedStringKey("onboardingTitle")
    static let dismissButtonTitle = LocalizedStringKey("dismissTitle")
    static let startChatButtonTitle = LocalizedStringKey("startChatTitle")
    static let contactsTitle = LocalizedStringKey("contactsTitle")
    static let searchBarTitle = LocalizedStringKey("searchBarTitle")
}
