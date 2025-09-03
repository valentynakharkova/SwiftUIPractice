//
//  SpotifyPlaylistView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    @StateObject private var viewModel = SpotifyPlaylistViewModel()
    
    var products: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    
                }
            }
        
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
