//
//  ChatModel.swift
//  ChatApp
//
//  Created by 高橋蓮 on 2022/02/04.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var message: [Message]
    var hasUnreadMessage = false
    
}
struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imageString: String
    
}
struct Message: Identifiable {
    enum MessageType {
        case Sent, Received
    }
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}
extension Chat {
    static let sampleChat = [
        Chat(person: Person(name: "Ren",imageString: "img2"), message: [
            Message("Hello", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Hello", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("jvojbiwenvpoqnevopq", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("vpwoenbvoedneqvapbvnepqbqa", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("vbnqeonv@eonve@oqngqoe", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("bvnwaopnbwknbpqenqa@obnebepqk", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("wpbvknepnq@oenkd pienb@oqebpkwb ", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("bneqo evnoeq@nveqo nbo@en@oeqnbjrbpegnqegbboewbnklb ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("kdvosibjcbvuegipankbugojvjbauakdwnvarouboawkengowiergnpwenvgpwiegbepkvneqvnengpienveqpovbpqei", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("dakvnpeknvkdabvoiqapbeknv;ekwrghqe@oavnadvdv", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("vpqnev@onaoqnqoenv@qeonv@eqonvqe@ovn@q", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("vfeeoefoefoefjeoejfoejfoejfeojfeofefeojfeojfoejfoejfeojfeo", type: .Sent, date: Date())
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Ore", imageString: "img1"), message: [
            Message("Hellohello", type: .Received),
            Message("good", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("sleep", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("fsadgsbfd", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("sfbff", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("bvnwaopnbwknbpqenqa@obnebepqk", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("dsvddvsd", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("bvnwaopnbwknbpqenqa@obnebepqk", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("ねむい", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("bvnwaopnbwknbpqenqa@obnebepqk", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("疲れた", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("bvnwaopnbwknbpqenqa@obnebepqk", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("StacOver", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("bvnwaopnbwknbpqenqa@obnebepqk", type: .Received, date: Date(timeIntervalSinceNow: -86400)),
        ], hasUnreadMessage: true),
    ]
}
