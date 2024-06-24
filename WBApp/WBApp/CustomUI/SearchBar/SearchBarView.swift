//
//  SearchBarView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(.icSearch)
                .padding(.leading, 8)
            
            TextField("",
                      text: $searchText,
                      prompt: Text(.searchBarTitle)
                .searchBarTitle()
                .foregroundColor(Color.grayMainText)
            )
            .frame(height: 36)
        }
        .background(Color.searchBarBackground)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.horizontal)
        .padding(.top)
    }
}

// MARK: - Preview

#Preview {
    ContactsView()
}
