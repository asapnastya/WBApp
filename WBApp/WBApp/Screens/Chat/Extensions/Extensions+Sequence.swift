//
//  Extensions+Sequence.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/30/24.
//

import SwiftUI

extension Sequence {
    
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()
        
        for element in self {
            try await values.append(transform(element))
        }
        
        return values
    }
}

