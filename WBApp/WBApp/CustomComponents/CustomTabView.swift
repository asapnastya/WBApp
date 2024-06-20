//
//  CustomTabView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

enum Tabs: Hashable {
    
    case contacts
    case chat
    case settings
}

struct CustomTabView: View {
    
    @StateObject var router: Router = .init()
    
    let tabs: [Tabs] = [.contacts, .chat, .settings]
    
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
                    TabButton(tab: tab, selectedTab: $router.selectedTab)
                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 30)
            .background(Color.background)
            .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: -1)
        })
    }
}

#Preview {
    CustomTabView()
}
