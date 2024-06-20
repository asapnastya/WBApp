//
//  ContactsView_Row.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

struct ContactsView_Row: View {
    var contact: ContactView_Model
    
    @State private var isOnline: Bool
    @State private var hasStory: Bool
    
    init(contact: ContactView_Model) {
        self.contact = contact
        _isOnline = State(initialValue: contact.isOnline)
        _hasStory = State(initialValue: contact.hasStory)
    }
    
    var body: some View {
        HStack {
            ZStack {
                
                if let profileImage = contact.profileImage {
                    Image(profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.leading, 4)
                } else {
                    Text(getInitials(from: contact.name))
                        .initialsTitle1()
                        .frame(width: 48, height: 48)
                        .background(Color.purpleBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.leading, 4)
                }
                
                if isOnline {
                    Circle()
                        .foregroundStyle(.greenCircle)
                        .frame(width: 12, height: 12)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .offset(x: 20, y: -20)
                }
                
                if hasStory {
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(LinearGradient(gradient: Gradient(colors: [.linearGradient1, .linearGradient2]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                        .frame(width: 56, height: 56)
                        .offset(x: 2, y: 0)
                }
            }
            .padding(.vertical, 4)
            
            VStack(alignment: .leading) {
                Text(contact.name)
                    .contactNameTitle()
                    .padding(.bottom, 2)
                    .padding(.horizontal, 5)
                
                Text(contact.status)
                    .statusTitle()
                    .padding(.bottom, 8)
                    .padding(.horizontal, 5)
            }
            Spacer()
        }
    }
}

#Preview {
    ContactsView()
}


func getInitials(from fullName: String) -> String {
    let components = fullName.split(separator: " ")
    guard components.count > 1 else { return "" }
    let firstNameInitial = components[0].first ?? Character("")
    let lastNameInitial = components[1].first ?? Character("")
    return "\(firstNameInitial)\(lastNameInitial)"
}
