//
//  SpotifyPlaylistView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router
    
    @StateObject private var viewModel = SpotifyPlaylistViewModel()
    
    var product: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        imageName: product.firstImage,
                        height: 250,
                        title: product.title,
                        subtitle: product._brand,
                    )
                    .readingFrame { frame in
                        viewModel.showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(viewModel.products) { product in
                        PlaylistSongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {
                                goToPlaylistView(product: product)
                            },
                            onEllipsisPressed: nil
                        )
                        .padding(.leading, 16)
                    }
                }
            }
            header
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .task {
            await viewModel.getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func goToPlaylistView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y: viewModel.showHeader ? 0 : -40)
                .opacity(viewModel.showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(viewModel.showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: viewModel.showHeader)
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
