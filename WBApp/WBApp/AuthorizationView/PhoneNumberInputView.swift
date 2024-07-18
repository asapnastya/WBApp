//
//  PhoneNumberInputView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/16/24.
//

import SwiftUI

struct PhoneNumberInputView: View {
    
    @Binding var phoneNumber: String
    @FocusState var isPhoneNumberFocused: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(.icRussiaFlag)
                    .frame(width: 16, height: 16)
                Text(.ruPhoneCodeTitle)
                    .phoneCodeTitle()
            }
            .frame(width: 57, height: 36)
            .background(.phoneBackground)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(.leading, 24)
            .padding(.trailing, 8)
            
            TextField(
                "000 000-00-00",
                text: $phoneNumber
            )
            .padding(.horizontal, 8)
            .focused($isPhoneNumberFocused)
            .keyboardType(.numberPad)
            .onChange(of: phoneNumber) { _ in
                if !phoneNumber.isEmpty {
                    phoneNumber = phoneNumber.formatPhoneNumber()
                }
            }
            .font(.custom("SFProDisplay-Semibold", size: 14))
            .foregroundColor(
                phoneNumber.isEmpty
                ? .phoneNumberEmpty
                : .phoneNumberEntered
            )
            .frame(height: 36)
            .background(.phoneBackground)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

#Preview {
    PhoneNumberInputView(phoneNumber: .constant(""))
}
