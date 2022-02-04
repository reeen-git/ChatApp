//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by 高橋蓮 on 2022/02/04.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var chats = Chat.sampleChat
    func getSort(query: String) -> [Chat] {
        let sortedChat = chats.sorted {
            guard let date1 = $0.message.last?.date else {return false}
            guard let date2 = $1.message.last?.date else {return false}
            return date1 > date2
        }
        if query == "" {
            return sortedChat
        }
        return sortedChat.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    func markAsUnread(_ newValue: Bool, chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
}
