//
//  SecondView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/16/24.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        UniversalButton(title: .dismissButtonTitle) {
            dismiss()
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.background))
    }
}

#Preview {
    SecondView()
}
