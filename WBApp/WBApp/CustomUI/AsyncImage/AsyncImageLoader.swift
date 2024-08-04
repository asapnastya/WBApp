//
//  AsyncImageLoader.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/2/24.
//

import SwiftUI

final class AsyncImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func load() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        } catch {
            print("Failed to load image: \(error)")
        }
    }
}
