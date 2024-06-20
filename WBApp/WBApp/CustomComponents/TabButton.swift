//
//  TabButton.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/20/24.
//

import SwiftUI

struct TabButton: View {
    
    var tab: Tabs
    
    @Binding var selectedTab: Tabs
    
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
            return Image(selectedTab == .contacts ? "img_contacts_active" : "img_contacts_inactive")
        case .chat:
            return Image(selectedTab == .chat ? "img_chat_active" : "img_chat_inactive")
        case .settings:
            return Image(selectedTab == .settings ? "img_settings_active" : "img_settings_inactive")
        }
    }
}

#Preview {
    CustomTabView()
}
