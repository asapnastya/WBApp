//
//  Extension+Binding.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/20/24.
//

import SwiftUI

extension Binding where Value == String {
    
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        
        return self
    }
}
