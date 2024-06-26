//
//  ContactView_Model.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI

struct ContactView_Model: Codable {
    
    var id: Int
    var name: String
    var status: String
    var profileImage: String?
    var isOnline: Bool = false
    var hasStory: Bool = false
    var phoneNumber: String
}

extension ContactView_Model: Hashable, Identifiable {}

let contacts: [ContactView_Model] = [
    .init(id: 1, name: "Анастасия Иванова", status: "Last seen yesterday", profileImage: "img_anastasiia_ivanova", isOnline: false, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(id: 2, name: "Петя", status: "Online", profileImage: "img_petya", isOnline: true, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(id: 3, name: "Маман", status: "Last seen 3 hours ago", profileImage: "img_maman", isOnline: false, hasStory: true, phoneNumber: "+7 999 999-99-99"),
    .init(id: 4, name: "Арбуз Дыня", status: "Online", profileImage: "img_arbuz_dinya", isOnline: true, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(id: 5, name: "Иван Иванов", status: "Online", profileImage: nil, isOnline: true, hasStory: false, phoneNumber: "+7 999 999-99-99"),
    .init(id: 6, name: "Лиса Алиса", status: "Last seen 30 minutes ago", profileImage: nil, isOnline: false, hasStory: true, phoneNumber: "+7 999 999-99-99")
]
