//
//  BackButtonModifier.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/20/24.
//

import SwiftUI

public struct BackButtonModifier: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss
    
    private var icon: Image
    
    public init(icon: Image) {
        self.icon = icon
    }
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        icon
                            .frame(width: 24, height: 24)
                    }
                }
            }
    }
}
