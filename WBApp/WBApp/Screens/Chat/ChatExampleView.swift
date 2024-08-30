//
//  ChatExampleView.swift
//  WBApp
//
//  Created by Анастасия Романова on 6/18/24.
//

import SwiftUI
import ExyteChat

struct ChatExampleView: View {
    
    @StateObject private var viewModel: ChatExampleView_Model
    
    private let title: String
    
    init(
        viewModel: ChatExampleView_Model = ChatExampleView_Model(),
        title: String
    ){
        _viewModel = StateObject(wrappedValue: viewModel)
        self.title = title
    }
    
    var body: some View {
        ChatView(
            messages: viewModel.messages,
            chatType: .conversation
        ) { draft in
            viewModel.send(draft: draft)
        }
        .enableLoadMore(pageSize: 3) { message in
            viewModel.loadMoreMessage(before: message)
        }
        .messageUseMarkdown(messageUseMarkdown: true)
        .chatNavigation(
            title: viewModel.chatTitle,
            status: viewModel.chatStatus,
            cover: viewModel.chatCover
        )
        .onAppear(perform: viewModel.onStart)
        .onDisappear(perform: viewModel.onStop)
    }
}
