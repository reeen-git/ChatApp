//
//  ChatRow.swift
//  ChatApp
//
//  Created by 高橋蓮 on 2022/02/04.
//

import SwiftUI

struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 20) {
            Image(chat.person.imageString)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(chat.person.name)
                            .bold()
                        Spacer()
                        Text(chat.message.last?.date.descriptiveString() ?? "")
                        
                    }
                    HStack {
                        Text(chat.message.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
            }
            Circle()
                .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                .frame(width: 18, height: 18)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(height: 80)

    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[1])
    }
}
