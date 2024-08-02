//
//  SearchBarView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

public struct SearchBarView: View {
    
    @Binding private var searchText: String
    
    private var icon: Image
    private var textColor: Color
    private var backgroundColor: Color
    private var text: Text
    
    public init(
        searchText: Binding<String>,
        icon: Image,
        textColor: Color,
        backgroundColor: Color,
        text: Text
    ){
        self._searchText = searchText
        self.icon = icon
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.text = text
    }
    
    public var body: some View {
        HStack {
            icon
                .padding(.leading, 8)
            
            TextField("",
                      text: $searchText,
                      prompt: text
                .foregroundColor(textColor)
            )
            .frame(height: 36)
        }
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.horizontal)
        .padding(.top)
    }
}
