//
//  WBAppWidgetEntryView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/25/24.
//

import WidgetKit
import SwiftUI

struct WBAppWidgetEntryView : View {
    
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            switch entry.contact?.profileImage {
            case .some(let profileImage):
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.leading, 4)
                
            case .none:
                Text(String.getInitials(from: entry.contact?.name ?? .placeholderName))
                    .initialsTitle1()
                    .frame(width: 48, height: 48)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.leading, 4)
            }
            
            
            Text(entry.contact?.name ?? .placeholderName)
                .font(.headline)
            
            Text(entry.contact?.phoneNumber ?? .placeholderPhone)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Button(action: {
                // TODO: - add routing to chat after chat screen impl
            }) {
                Text(.buttonText)
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
