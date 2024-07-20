//
//  ConfirmationCodeModel.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/19/24.
//

import SwiftUI

enum PhoneCode: String {
    
    case ru
    
    var code: String {
        switch self {
            
        case .ru:
            return "+7"
        }
    }
}

struct ConfirmationCodeModel: Sequence {
    
    var phoneCode: PhoneCode = .ru
    var phoneNumber: String
    
    let codeLength = 4
    
    var fullPhoneNumber: String {
        [phoneCode.code, phoneNumber.formatPhoneNumber()]
            .joined(separator: " ")
    }
    
    var confirmationCode: String
    
    func makeIterator() -> some IteratorProtocol {
        ConfirmationDetailsIterator(self)
    }
}

struct ConfirmationDetailsIterator: IteratorProtocol {
    
    private let details: [String]
    private var currentIndex: Int = .zero
    
    init(_ confirmationCodeModel: ConfirmationCodeModel) {
        self.details = [
            confirmationCodeModel.phoneNumber,
            confirmationCodeModel.confirmationCode
        ]
    }
    
    mutating func next() -> String? {
        guard currentIndex < details.count else { return nil }
        
        let detail = details[currentIndex]
        currentIndex += 1
        
        return detail
    }
}
