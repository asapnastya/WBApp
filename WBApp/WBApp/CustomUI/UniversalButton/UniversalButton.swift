//
//  UniversalButton.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/12/24.
//

import SwiftUI

struct UniversalButton: View {
    
    var title: LocalizedStringKey
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .buttonTitle1()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
        }
        .background(Color(.purpleButton))
        .cornerRadius(30)
    }
}
