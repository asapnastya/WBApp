//
//  AppIntent.swift
//  WBAppWidget
//
//  Created by Анастасия Романова on 6/25/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    
    static var title: LocalizedStringResource = "Widget"
    static var description = IntentDescription("This is the favourite contact widget.")
}
