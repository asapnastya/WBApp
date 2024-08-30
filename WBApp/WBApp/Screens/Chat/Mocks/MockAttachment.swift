//
//  MockAttachment.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/30/24.
//

import SwiftUI
import ExyteChat

struct MockImage {
    let id: String
    let thumbnail: URL
    let full: URL
    
    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .image
        )
    }
}

struct MockVideo {
    let id: String
    let thumbnail: URL
    let full: URL
    
    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .video
        )
    }
}
