//
//  ContactDetailsView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/17/24.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    let contact: ContactView_Model
    
    var body: some View {
        
        VStack {
            switch contact.profileImage {
            case .some(let profileImage):
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top, 48)
                    .padding(.horizontal, 87)
                    .padding(.bottom, 7)
                
            case .none:
                Text(String.getInitials(from: contact.name))
                    .initialsTitle2()
                    .frame(width: 200, height: 200)
                    .background(Color.purpleBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top, 48)
                    .padding(.horizontal, 87)
                    .padding(.bottom, 7)
            }
            
            Text(contact.name)
                .profileTitle1()
            
            Text(contact.phoneNumber)
                .numberTitle()
                .padding(.bottom, 35)
            
            HStack(spacing: 12) {
                SocialNetworkButton(coverImage: .icTwitter, action: {})
                SocialNetworkButton(coverImage: .icInsta, action: {})
                SocialNetworkButton(coverImage: .icLinkedin, action: {})
                SocialNetworkButton(coverImage: .icFacebook, action: {})
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .background(Color.background)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    HStack {
                        Image(.icBackButton)
                            .frame(width: 24, height: 24)
                        Text(.contactsTitle)
                            .navBarTitle1()
                            .padding(.horizontal, 5)
                    }
                }
            }
        }
    }
}

// MARK: - SocialNetworkButton
struct SocialNetworkButton: View {
    
    var coverImage: ImageResource
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(coverImage)
                .resizable()
                .frame(width: 20, height: 20)
                .scaledToFit()
        }
        .frame(width: 71, height: 40)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(Capsule().stroke(Color.purpleButton, lineWidth: 1.67))
    }
}

// MARK: - Preview
#Preview {
    ContactDetailsView(
        contact: ContactView_Model(
            name: "Иван Иванов",
            status: "Last seen yesterday",
            profileImage: nil,
            isOnline: false,
            hasStory: false,
            phoneNumber: "+7 999 999-99-99")
    )
}
