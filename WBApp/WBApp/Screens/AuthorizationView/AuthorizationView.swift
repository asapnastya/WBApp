//
//  AuthorizationView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/14/24.
//

import SwiftUI
import UISystem

struct AuthorizationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var phoneNumber: String = ""
    @State private var isContinueButtonTapped: Bool = false
    @State private var confirmationCodeModel = ConfirmationCodeModel(
        phoneNumber: "",
        confirmationCode: ""
    )
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
                    
                    UniversalButton(
                        color: .purpleButton,
                        text: Text(.continueTitle).buttonTitle1()
                    ){
                        withAnimation {
                            confirmationCodeModel.phoneNumber = phoneNumber
                            isContinueButtonTapped.toggle()
                        }
                    }
                    .opacity(
                        phoneNumber.count <= 12
                        ? 0.5
                        : 1
                    )
                    .disabled(phoneNumber.count <= 12)
                    .padding(.horizontal, 24)
                    
                    Spacer()
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(Color.background)
                .modifier(
                    BackButtonModifier(
                        icon: Image(
                            .icBackButton
                        )
                    )
                )
                .navigationDestination(
                    isPresented: $isContinueButtonTapped
                ){
                    AuthorizationConfirmationView(
                        confirmationCodeModel: confirmationCodeModel
                    )
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
