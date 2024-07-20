//
//  AuthorizationConfirmation_HeaderView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/19/24.
//

import SwiftUI

struct AuthorizationConfirmation_HeaderView: View {
    
    @Binding var confirmationCodeModel: ConfirmationCodeModel
    
    var body: some View {
        VStack {
            Text(.enterConfirmationCodeTitle)
                .headline1()
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            
            Text(.enterConfirmationCodeSubtitle)
                .subtitle2()
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
            
            Text(confirmationCodeModel.fullPhoneNumber)
                .subtitle2()
        }
    }
}

#Preview {
    AuthorizationConfirmationView(
        confirmationCodeModel: ConfirmationCodeModel(
            phoneNumber: "9999999999",
            confirmationCode: ""
        )
    )
}
