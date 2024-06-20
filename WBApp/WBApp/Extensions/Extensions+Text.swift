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
            return text.foregroundStyle(.blackText)
        } else {
            return text.foregroundColor(.blackText)
        }
    }
    
    func subtitle1() -> Text {
        return self
            .font(.custom("SFProDisplay-Regular", size: 10))
    }
    
    func contactNameTitle() -> Text {
        let text = self.font(.custom("SFProDisplay-Semibold", size: 14))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.blackText)
        } else {
            return text.foregroundColor(.blackText)
        }
    }
    
    func statusTitle() -> Text {
        let text = self.font(.custom("SFProDisplay-Regular", size: 12))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.grayMainText)
        } else {
            return text.foregroundColor(.grayMainText)
        }
    }
    
    func profileTitle1() -> Text {
        let text = self.font(.custom("SFProDisplay-Semibold", size: 24))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.blackText)
        } else {
            return text.foregroundColor(.blackText)
        }
    }
    
    func numberTitle() -> Text {
        let text = self.font(.custom("SFProDisplay-Regular", size: 16))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.grayMainText)
        } else {
            return text.foregroundColor(.grayMainText)
        }
    }
    
    func navBarTitle1() -> Text {
        let text = self.font(.custom("SFProDisplay-Semibold", size: 18))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.blackText)
        } else {
            return text.foregroundColor(.blackText)
        }
    }
    
    func initialsTitle1() -> Text {
        let text = self.font(.custom("Lato-Bold", size: 14))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.initialsText)
        } else {
            return text.foregroundColor(.initialsText)
        }
    }
    
    func initialsTitle2() -> Text {
        let text = self.font(.custom("Lato-Bold", size: 50))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.initialsText)
        } else {
            return text.foregroundColor(.initialsText)
        }
    }
    
    func searchBarTitle() -> Text {
        let text = self.font(.custom("SFProDisplay-Semibold", size: 14))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.grayMainText)
        } else {
            return text.foregroundColor(.grayMainText)
        }
    }
    
    func buttonTitle1() -> Text {
        let text = self.font(.custom("SFProDisplay-Semibold", size: 16))
        
        if #available(iOS 17.0, *) {
            return text.foregroundStyle(.buttonTitle)
        } else {
            return text.foregroundColor(.buttonTitle)
        }
    }
}
