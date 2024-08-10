//
//  CustomTabView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI
import AppIntents

enum Tabs: String, AppEnum  {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Tabs"
    static var caseDisplayRepresentations: [Tabs : DisplayRepresentation] =  [
        .contacts: .init(stringLiteral: "Контакты"),
        .chat: .init(stringLiteral: "Чат"),
        .settings: .init(stringLiteral: "Настройки"),
        .catFacts: .init(stringLiteral: "Факты")
    ]
    
    case contacts
    case chat
    case settings
    case catFacts
}

extension Tabs: Hashable {}

struct CustomTabView: View {
    
    @StateObject private var router: Router = Router.shared
    
    private let tabs: [Tabs] = [.contacts, .chat, .settings, .catFacts]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            TabView(selection: $router.selectedTab) {
                ContactsView()
                    .tag(Tabs.contacts)
                
                ChatView()
                    .tag(Tabs.chat)
                
                SettingsView()
                    .tag(Tabs.settings)
                
                CatFactsView()
                    .tag(Tabs.catFacts)
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
