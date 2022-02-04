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
            Text("Helo")
            
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.markAsUnread(false, chat: chat)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatViewModel())
    }
}
