//
//  AuthorizationHeaderView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/16/24.
//

import SwiftUI

struct AuthorizationHeaderView: View {
    
    var body: some View {
        Text(.enterPhoneNumberTitle)
            .headline1()
            .lineSpacing(3)
            .multilineTextAlignment(.center)
            .padding(.leading, 40)
            .padding(.trailing, 42)
            .padding(.top, 79)
            .padding(.bottom, 8)
        
        Text(.enterPhoneNumberSubtitle)
            .subtitle2()
            .lineSpacing(10)
            .multilineTextAlignment(.center)
            .padding(.leading, 40)
            .padding(.trailing, 42)
            .padding(.bottom, 49)
    }
}

#Preview {
    AuthorizationHeaderView()
}
