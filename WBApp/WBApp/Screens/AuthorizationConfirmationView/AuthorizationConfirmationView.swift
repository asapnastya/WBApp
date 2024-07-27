//
//  AuthorizationConfirmationView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/18/24.
//

import SwiftUI
import UISystem

struct AuthorizationConfirmationView: View {
    
    @State var confirmationCodeModel: ConfirmationCodeModel
    
    @State private var confirmationCode: String = ""
    
    var body: some View {
        VStack {
            AuthorizationConfirmation_HeaderView(confirmationCodeModel: $confirmationCodeModel)
                .padding(.top, 98)
                .padding(.bottom, 49)
            
            OTPFieldView(
                codeText: $confirmationCode,
                codeLength: confirmationCodeModel.codeLength
            ){ confirmationCode in
                print("Confirmation Code - \(confirmationCode)")
            }
            .padding(.bottom, 89)
            
            Button(action: {
                confirmationCode = ""
            }) {
                Text(.resendConfirmationCodeTitle)
                    .resendConfirmationCodeTitle()
            }
            .padding(.bottom, 68)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .navigationBarBackButtonHidden()
        .modifier(
            BackButtonModifier(
                icon: Image(
                    .icBackButton
                )
            )
        )
    }
}


#Preview {
    NavigationStack {
        AuthorizationConfirmationView(
            confirmationCodeModel: ConfirmationCodeModel(
                phoneNumber: "9999999999",
                confirmationCode: "11"
            )
        )
    }
}
