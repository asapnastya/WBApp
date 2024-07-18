//
//  Extensions+AnyTransition.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/17/24.
//

import SwiftUI

extension AnyTransition {
    
    static func rotateAndMove(
        amount: Double = 90,
        anchor: UnitPoint
    ) -> AnyTransition {
        .modifier(
            active: CornerRotateModifier(
                amount: amount,
                anchor: anchor
            ),
            identity: CornerRotateModifier(
                amount: .zero,
                anchor: anchor
            )
        )
    }
}
