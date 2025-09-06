//
//  NewReleaseCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 02.09.2025.
//

import SwiftUI

struct NewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release music"
    var subheadline: String? = "Some artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title "
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture { onAddToPlaylistPressed?() }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.vertical, 8)
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                 onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        NewReleaseCell()
            .padding()
    }
}
