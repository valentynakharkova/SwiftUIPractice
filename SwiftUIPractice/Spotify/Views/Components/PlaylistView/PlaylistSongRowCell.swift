//
//  PlaylistSongRowCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import SwiftUI

struct PlaylistSongRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some title goes here"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            PlaylistSongRowCell()
            PlaylistSongRowCell()
            PlaylistSongRowCell()
            PlaylistSongRowCell()
            PlaylistSongRowCell()
        }
    }
}
