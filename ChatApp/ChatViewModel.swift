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
    
    func getSectionMessage(for chat: Chat) -> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.message {
            if let firstMessage = tmp.first {
                let dayBetween = firstMessage.date.daysBetween(date: message.date)
                if dayBetween >= 1 {
                    res.append(tmp)
                    tmp.removeAll()
                    tmp.append(message)
                } else {
                    tmp.append(message)
                }
            } else {
                tmp.append(message)
            }
        }
        res.append(tmp)
        return res
    }
    
    func markAsUnread(_ newValue: Bool, chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
    func sendMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let message = Message(text, type: .Sent)
            chats[index].message.append(message)
            return message
        }
        return nil
    }
}
