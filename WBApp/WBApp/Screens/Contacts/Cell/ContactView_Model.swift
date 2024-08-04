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
    var profileImageURL: URL?
    var isOnline: Bool = false
    var hasStory: Bool = false
    var phoneNumber: String
}

extension ContactView_Model: Hashable, Identifiable {}

let contacts: [ContactView_Model] = [
    .init(
        id: 1,
        name: "Анастасия Иванова",
        status: "Last seen yesterday",
        profileImageURL: URL(
            string: "https://i.ibb.co/Nthbz10/4.jpg"
        ),
        isOnline: false,
        hasStory: false,
        phoneNumber: "+7 999 999-99-99"
    ),
    .init(
        id: 2,
        name: "Петя",
        status: "Online",
        profileImageURL: URL(
            string: "https://i.ibb.co/KG3Qxyy/3.jpg"
        ),
        isOnline: true,
        hasStory: false,
        phoneNumber: "+7 999 999-99-99"
    ),
    .init(
        id: 3,
        name: "Маман",
        status: "Last seen 3 hours ago",
        profileImageURL: URL(
            string: "https://i.ibb.co/vhqXx8N/2.jpg"
        ),
        isOnline: false,
        hasStory: true,
        phoneNumber: "+7 999 999-99-99"
    ),
    .init(
        id: 4,
        name: "Арбуз Дыня",
        status: "Online",
        profileImageURL: URL(
            string: "https://i.ibb.co/GQxs1yD/1.jpg"
        ),
        isOnline: true,
        hasStory: false,
        phoneNumber: "+7 999 999-99-99"
    ),
    .init(
        id: 5,
        name: "Иван Иванов",
        status: "Online",
        profileImageURL: nil,
        isOnline: true,
        hasStory: false,
        phoneNumber: "+7 999 999-99-99"
    ),
    .init(
        id: 6,
        name: "Лиса Алиса",
        status: "Last seen 30 minutes ago",
        profileImageURL: nil,
        isOnline: false,
        hasStory: true,
        phoneNumber: "+7 999 999-99-99"
    )
]
