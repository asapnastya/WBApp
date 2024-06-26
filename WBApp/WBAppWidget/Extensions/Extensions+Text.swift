//
//  Extensions+Text.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/25/24.
//

import SwiftUI

extension Text {
    
    func initialsTitle1() -> Text {
        let text = self.font(.system(size: 14, weight: .bold))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.white)
        } else {
            return text.foregroundColor(.white)
        }
    }
}
