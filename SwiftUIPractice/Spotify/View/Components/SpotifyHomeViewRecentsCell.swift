//
//  SpotifyHomeViewRecentsCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 02.09.2025.
//

import SwiftUI

struct SpotifyHomeViewRecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title for this View"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyHomeViewRecentsCell()
                SpotifyHomeViewRecentsCell()
            }
            HStack {
                SpotifyHomeViewRecentsCell()
                SpotifyHomeViewRecentsCell()
            }
        }
    }
}
