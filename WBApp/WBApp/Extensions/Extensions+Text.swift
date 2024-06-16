//
//  Fonts.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/16/24.
//

import SwiftUI

extension Text {
    
    func headline1() -> Text {
        let text = self.font(.custom("SFProDisplay-Bold", size: 24))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(Color(.blackText))
        } else {
            return text.foregroundColor(Color(.blackText))
        }
    }
    
    func subtitle1() -> Text {
        return self
            .font(.custom("SFProDisplay-Regular", size: 10))
    }
    
    func buttonTitle1() -> Text {
        let text = self.font(.custom("SFProDisplay-Semibold", size: 16))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(Color(.buttonTitle))
        } else {
            return text.foregroundColor(Color(.buttonTitle))
        }
    }
}
