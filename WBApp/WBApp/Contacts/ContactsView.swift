//
//  ContactsView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/16/24.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var path = [ContactView_Model]()
    //    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    @State private var selectedContact: ContactView_Model? = nil
    @State private var navigateToProfile: Bool = false
    
    var filteredContacts: [ContactView_Model] {
        
        guard !searchText.isEmpty else { return contacts }
        return contacts.filter { contact in
            contact.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack(spacing: .zero) {
                SearchBarView(searchText: $searchText)
                
                List(filteredContacts) { contact in
                    ContactsView_Row(contact: contact)
                        .alignmentGuide(.listRowSeparatorLeading) { _ in
                            return .zero
                        }
                        .alignmentGuide(.listRowSeparatorTrailing) { viewDimensions in
                            return viewDimensions.width
                        }
                        .onTapGesture {
                            selectedContact = contact
                            navigateToProfile.toggle()
                        }
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(.contactsTitle)
                            .navBarTitle1()
                            .padding(.horizontal, 1)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Image(.imgPlusButton)
                                .frame(width: 24, height: 24)
                                .padding(.horizontal, 1)
                        }
                    }
                }
                .navigationDestination(isPresented: $navigateToProfile) {
                    if let contact = selectedContact {
                        ContactDetailView(contact: contact)
                    }
                }
            }
            .background(Color.background)
        }
    }
}

#Preview {
    ContactsView()
}
