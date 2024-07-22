//
//  ConfirmationCodeTextBoxModifier.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/17/24.
//

import SwiftUI

struct ConfirmationCodeTextBoxModifier: ViewModifier {
    
    @Binding var confirmationCodeText: String
    
    let index: Int
    
    func body(content: Content) -> some View {
        ZStack {
            if confirmationCodeText.count > index {
                
                let startIndex = confirmationCodeText.startIndex
                let charIndex = confirmationCodeText.index(startIndex, offsetBy: index)
                let charToString = String(confirmationCodeText[charIndex])
                
                Text(charToString)
                    .confirmationCodeTitle()
                    .frame(width: 24, height: 24)
            } else {
                Circle()
                    .foregroundStyle(.confirmationCodeCircles)
                    .frame(width: 24, height: 24)
            }
        }
    }
}
