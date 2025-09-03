//
//  SpotifyPlaylistView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyPlaylistView: View {
    
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
                    
                    
                }
            }
        
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
