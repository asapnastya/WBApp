//
//  OnboardingView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/11/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var isSheetPresented = false
    
    private var agreementText: AttributedString {
        return .makeAgreementAttributedString()
    }
    
    var body: some View {
            NavigationStack {
                VStack {
                    Image(.imgOnboarding)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 262,
                               height: 271)
                        .padding(.top, 91)
                        .padding(.bottom, 42)
                        .padding(.horizontal, 62)
                    
                    Text(.onboardingTitle)
                        .headline1()
                        .lineSpacing(3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 47)
                    
                    Spacer()
                    
                    Text(agreementText)
                        .subtitle1()
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.bottom, 13)
                        .padding(.horizontal, 24)
                    
                    UniversalButton(
                        title: .startChatButtonTitle
                    ) {
                        isSheetPresented.toggle()
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
                .background(Color(.background))
                .fullScreenCover(isPresented: $isSheetPresented) {
                    CustomTabView()
                }
            }
        }
    }
// MARK: - AttributedString
private extension AttributedString {
    
    static func makeAgreementAttributedString() -> AttributedString {
        var attributedString = AttributedString(.agreementText)
        attributedString.foregroundColor = Color(.grayText)
        
        let keywords: [String] = [
            .privacyPolicy,
            .termsOfUse
        ]
        
        keywords.forEach { keyword in
            if let range = attributedString.range(of: keyword) {
                attributedString[range].foregroundColor = Color(.purpleText)
            }
        }
        return attributedString
    }
}

#Preview {
    OnboardingView()
}
