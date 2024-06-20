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
            Image(.imgSearch)
                .padding(.leading, 8)
            
            TextField(.searchBarTitle, text: $searchText)
                .frame(height: 36)
                .font(.custom("SFProDisplay-Semibold", size: 14))
                .foregroundStyle(Color.grayMainText)
        }
        .background(Color.searchBarBackground)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    ContactsView()
}
