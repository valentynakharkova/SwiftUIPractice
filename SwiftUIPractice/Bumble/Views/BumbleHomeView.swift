//
//  BumbleHomeView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    
    @AppStorage("bumble_home_filter") private var selectedFilter = "Everyone"
    
    @StateObject private var viewModel = BumbleHomeViewModel()
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                FilterView(options: viewModel.filters, selection: $selectedFilter)
                
                ZStack {
                    if !viewModel.allUsers.isEmpty {
                        ForEach(Array(viewModel.allUsers.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPrevious = (viewModel.selectedIndex - 1) == index
                            let isCurrent = viewModel.selectedIndex == index
                            let isNext = (viewModel.selectedIndex + 1) == index
                            
                            if isPrevious || isCurrent || isNext {
                                
                                let offsetValue = viewModel.cardOffsets[user.id]
                                
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(viewModel.allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    overlaySwipingindicators
                        .zIndex(99999)
                }
                .frame(maxHeight: .infinity)
                .padding(4)
                .animation(.smooth, value: viewModel.cardOffsets)
            }
            .padding(8)
        }
        .task {
            await viewModel.getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
    
    private func userProfileCell(user: User, index: Int) -> some View {
        CardView(
            user: user,
            onSuperlikePressed: nil,
            onXmarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onChackmarkPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onSendAComplimentPressed: nil,
            onHideAndReportPressed: nil
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            animation: .smooth,
            rotationMultiplier: 1.05,
            onChanged: { dragOffset  in
                viewModel.currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                if dragOffset.width < -50 {
                    userDidSelect(index: index, isLike: false)
                } else if dragOffset.width > 50 {
                    userDidSelect(index: index, isLike: true)
                }
            }
        )
    }
    
    private func userDidSelect(index: Int, isLike: Bool) {
        let user = viewModel.allUsers[index]
        viewModel.cardOffsets[user.id] = isLike
        
        viewModel.selectedIndex += 1
    }
    
    private var overlaySwipingindicators: some View {
        ZStack {
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(viewModel.currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: min(-viewModel.currentSwipeOffset, 180))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(viewModel.currentSwipeOffset) > 100 ? 1.5 : 1.0)
                .offset(x: max(-viewModel.currentSwipeOffset, -180))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .animation(.smooth, value: viewModel.currentSwipeOffset)
    }
}

#Preview {
    BumbleHomeView()
}
