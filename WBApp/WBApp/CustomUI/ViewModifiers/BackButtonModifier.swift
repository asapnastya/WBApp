//
//  BackButtonModifier.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/20/24.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(.icBackButton)
                            .frame(width: 24, height: 24)
                    }
                }
            }
    }
}
