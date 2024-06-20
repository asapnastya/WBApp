//
//  ContactsView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/16/24.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var path = [ContactView_Model]()
    @State private var searchText = ""
    @State private var selectedContact: ContactView_Model? = nil
    @State private var navigateToProfile: Bool = false
    
    private var filteredContacts: [ContactView_Model] {
        guard !searchText.isEmpty else { return contacts }
        
        return contacts.filter { contact in
            contact.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack() {
                SearchBarView(searchText: $searchText)
                
                List(filteredContacts) { contact in
                    ContactsView_Cell(contact: contact)
                        .listRowSeparatorTint(.separator)
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
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}) {
                            Image(.icPlusButton)
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                .navigationDestination(isPresented: $navigateToProfile) {
                    if let contact = selectedContact {
                        ContactDetailsView(contact: contact)
                    }
                }
            }
            .background(Color.background)
        }
    }
}

// MARK: - Preview

#Preview {
    ContactsView()
}
