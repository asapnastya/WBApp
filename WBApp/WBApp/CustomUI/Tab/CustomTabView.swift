//
//  CustomTabView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

enum Tabs {
    
    case contacts
    case chat
    case settings
}

extension Tabs: Hashable {}

struct CustomTabView: View {
    
    @StateObject private var router: Router = .init()
    
    private let tabs: [Tabs] = [.contacts, .chat, .settings]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            TabView(selection: $router.selectedTab) {
                ContactsView()
                    .tag(Tabs.contacts)
                
                ChatView()
                    .tag(Tabs.chat)
                
                SettingsView()
                    .tag(Tabs.settings)
            }
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton(selectedTab: $router.selectedTab, tab: tab)
                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 34)
            .background(Color.background)
            .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: -1)
        })
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview

#Preview {
    CustomTabView()
}
