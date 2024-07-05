//
//  Countries.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/5/24.
//

import SwiftUI

enum Countries: String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue }
    
    case ie = "🇮🇪"
    case de = "🇩🇪"
    case fr = "🇫🇷"
    case pl = "🇵🇱"
    case tr = "🇹🇷"
    
    var locales: Locale {
        switch self {
        case .ie: return Locale(identifier: "en_IE")
        case .de: return Locale(identifier: "de")
        case .fr: return Locale(identifier: "fr")
        case .pl: return Locale(identifier: "pl")
        case .tr: return Locale(identifier: "tr")
        }
    }
}
