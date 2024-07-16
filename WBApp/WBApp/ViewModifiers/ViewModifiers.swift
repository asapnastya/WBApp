//
//  ViewModifiers.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/17/24.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}
