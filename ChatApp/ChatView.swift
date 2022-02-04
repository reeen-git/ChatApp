//
//  ChatView.swift
//  ChatApp
//
//  Created by 高橋蓮 on 2022/02/04.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    let chat: Chat
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                ScrollView {
                    getMessageView(viewWidth: reader.size.width)
                }
            }.background(Color.yellow)
            
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.markAsUnread(false, chat: chat)
        }
    }
    let culumns = [GridItem(.flexible(minimum: 10))]
    func getMessageView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: culumns, spacing: 0) {
            ForEach(chat.message) { message in
                let isReceived = message.type == .Received
                HStack {
                    ZStack {
                        Text(message.text)
                    }
                    .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading : .trailing)
                    .padding(.vertical)
                    .background(Color.blue)
                }
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatViewModel())
    }
}
