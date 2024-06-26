//
//  Router.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/20/24.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var selectedTab: Tabs = .contacts
    
    static var shared: Router = .init()
    
    private init() {}
    
    func moveToTab(tab: Tabs) {
        DispatchQueue.main.async {
            self.selectedTab = tab
        }
    }
}
