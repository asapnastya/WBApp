//
//  CustomAsyncImage.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/2/24.
//

import SwiftUI

struct CustomAsyncImage<Placeholder: View>: View {
    
    @StateObject private var loader: AsyncImageLoader
    
    private let placeholder: Placeholder
    
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: AsyncImageLoader(url: url))
    }
    
    var body: some View {
        content
            .task {
                await loader.load()
            }
    }
    
    private var content: some View {
        Group {
            switch loader.image {
            case .some(let image):
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            case .none:
                placeholder
            }
        }
    }
}
