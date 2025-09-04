//
//  BumbleChatsView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct BumbleChatsView: View {
    
    @StateObject private var viewModel = BumbleChatsViewModel()
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                
                recentChatsSection
                
            }
        }
        .task {
            await viewModel.getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
//                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                    +
                Text(" (\(viewModel.allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.allUsers) { user in
                        ProfileImageCell(imageName: user.image, percentageRemaining: Double.random(in: 0...1), hasNewMessage: Bool.random())
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentChatsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Group {
                    Text("Chats")
                    +
                    Text(" (Recent)")
                        .foregroundStyle(.bumbleGray)
                }
                Spacer(minLength: 0)
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.allUsers) { user in
                        ChatPreviewCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(16)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleChatsView()
}
