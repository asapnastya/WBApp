//
//  ContactDetailView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/17/24.
//

import SwiftUI

struct ContactDetailView: View {
    
    let contact: ContactView_Model
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            if let profileImage = contact.profileImage {
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top, 48)
                    .padding(.horizontal, 87)
                    .padding(.bottom, 7)
            } else {
                Text(getInitials(from: contact.name))
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
                SocialNetworkButton(coverImage: .imgTwitter, action: {})
                SocialNetworkButton(coverImage: .imgInsta, action: {})
                SocialNetworkButton(coverImage: .imgLinkedin, action: {})
                SocialNetworkButton(coverImage: .imgFacebook, action: {})
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
                        Image(.imgBackButton)
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

struct SocialNetworkButton: View {
    
    var coverImage: ImageResource
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(coverImage)
                .resizable()
                .scaledToFit()
                .frame(width: 17.43, height: 14.16)
        }
        .frame(width: 71.67, height: 40)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(Capsule().stroke(Color.purpleButton, lineWidth: 1.67))
    }
}

#Preview {
    ContactDetailView(contact: ContactView_Model(name: "Иван Иванов", status: "Last seen yesterday", profileImage: nil, isOnline: false, hasStory: false, phoneNumber: "+7 999 999-99-99"))
}

