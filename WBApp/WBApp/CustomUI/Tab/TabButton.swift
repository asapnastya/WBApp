//
//  TabButton.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/20/24.
//

import SwiftUI

struct TabButton: View {
    
    @Binding var selectedTab: Tabs
    
    var tab: Tabs
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }, label: {
            tabImage
                .frame(width: 32, height: 32)
                .padding(.top, 18)
                .foregroundColor(Color.black.opacity(0.4))
        })
    }
    
    private var tabImage: Image {
        switch tab {
        case .contacts:
            return selectedTab == .contacts
            ? Image(.icContactsActive)
            : Image(.icContactsInactive)
            
        case .chat:
            return selectedTab == .chat
            ? Image(.icChatActive)
            : Image(.icChatInactive)
            
        case .settings:
            return selectedTab == .settings
            ? Image(.icSettingsActive)
            : Image(.icSettingsInactive)
        }
    }
}

// MARK: - Preview

#Preview {
    CustomTabView()
}
