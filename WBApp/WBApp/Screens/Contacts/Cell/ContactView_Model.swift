//
//  ContactView_Model.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

struct ContactView_Model {
    
    let id = UUID()
    var name: String
    var status: String
    var profileImage: ImageResource?
    var isOnline: Bool
    var hasStory: Bool
    var phoneNumber: String
}

extension ContactView_Model: Hashable, Identifiable {}

let contacts: [ContactView_Model] = [
    .init(name: "Анастасия Иванова", status: "Last seen yesterday", profileImage: .imgAnastasiiaIvanova, isOnline: false, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(name: "Петя", status: "Online", profileImage: .imgPetya, isOnline: true, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(name: "Маман", status: "Last seen 3 hours ago", profileImage: .imgMaman, isOnline: false, hasStory: true, phoneNumber: "+7 999 999-99-99"),
    .init(name: "Арбуз Дыня", status: "Online", profileImage: .imgArbuzDinya, isOnline: true, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(name: "Иван Иванов", status: "Online", profileImage: nil, isOnline: true, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(name: "Лиса Алиса", status: "Last seen 30 minutes ago", profileImage: nil, isOnline: false, hasStory: true, phoneNumber: "+7 999 999-99-99")
]
