//
//  OpenScreenIntent.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/24/24.
//

import AppIntents
import SwiftUI

struct OpenScreenIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Открыть экран WBApp"
    static var description: IntentDescription? = .init(stringLiteral: "Открывает выбранный экран WBApp")
    static var openAppWhenRun: Bool = true
    
    @Parameter(
        title: "Экран",
        requestDisambiguationDialog: "Какой экран открыть?"
    )
    
    var appTab: Tabs
    
    func perform() async throws -> some IntentResult {
        Router.shared.moveToTab(tab: appTab)
        return .result()
    }
}
