//
//  ChatInteractorProtocol.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/30/24.
//

import SwiftUI
import Combine
import ExyteChat

protocol ChatInteractorProtocol {
    
    var messages: AnyPublisher<[MockMessage], Never> { get }
    var senders: [MockUser] { get }
    var otherSenders: [MockUser] { get }
    
    func send(draftMessage: ExyteChat.DraftMessage)
    
    func connect()
    func disconnect()
    
    func loadNextPage() -> Future<Bool, Never>
}

