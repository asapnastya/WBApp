//
//  WBApp.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/11/24.
//

import SwiftUI

@main
struct WBApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            switch isOnboarding {
            case true:
                OnboardingView()
            case false:
                CustomTabView()
            }
        }
    }
}
