//
//  UniversalButton.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/12/24.
//

import SwiftUI

public struct UniversalButton: View {
    
    private var color: Color
    private var text: Text
    private var action: () -> Void
    
    public init(
        color: Color,
        text: Text,
        action: @escaping () -> Void
    ){
        self.color = color
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            text
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
        }
        .background(color)
        .cornerRadius(30)
    }
}
