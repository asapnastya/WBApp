//
//  InfinityScrollView_LayoutConfiguration.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/9/24.
//

import SwiftUI

enum InfinityScrollView_LayoutConfiguration: CaseIterable {
    case left, right, top, bottom
    
    static func chooseRandomConfiguration() -> Self {
        .allCases.randomElement() ?? .top
    }
}
