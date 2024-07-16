//
//  AuthorizationView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/14/24.
//

import SwiftUI

struct AuthorizationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var phoneNumber: String = ""
    @FocusState private var isPhoneNumberFocused: Bool
    
    var body: some View {
        NavigationStack {
            GeometryReader {_ in
                VStack {
                    AuthorizationHeaderView()
                    
                    PhoneNumberInputView(
                        phoneNumber: $phoneNumber,
                        isPhoneNumberFocused: _isPhoneNumberFocused
                    )
                    .padding(.trailing, 24)
                    .padding(.bottom, 69)
                    
                    UniversalButton(title: .continueTitle) {}
                        .opacity(
                            phoneNumber.isEmpty
                            ? 0.5
                            : 1
                        )
                        .disabled(phoneNumber.isEmpty)
                        .padding(.horizontal, 24)
                    
                    Spacer()
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(Color.background)
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
            .ignoresSafeArea(.keyboard)
        }
        .onAppear {
            isPhoneNumberFocused = true
        }
    }
}

#Preview {
    AuthorizationView()
}
