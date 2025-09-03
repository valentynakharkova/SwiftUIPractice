//
//  ImageTitleRowCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    var title: String = "Some title name"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
