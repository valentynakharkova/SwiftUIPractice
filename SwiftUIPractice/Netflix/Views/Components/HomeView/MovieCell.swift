//
//  MovieCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct MovieCell: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = true
    var topTenRanking: Int? = nil
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            
            ZStack(alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: 0) {
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord)
                            .font(.headline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .background(.netflixRed)
                        .cornerRadius(2)
                        .offset(y: 2)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1 )
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 6)
                .background {
                    LinearGradient(
                        colors: [.netflixBlack.opacity(0),
                                 .netflixBlack.opacity(0.3),
                                 .netflixBlack.opacity(0.4),
                                 .netflixBlack.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom,
                    )
                }
            }
            .cornerRadius(4)
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        VStack {
            MovieCell(isRecentlyAdded: false, topTenRanking: 1)
            MovieCell(isRecentlyAdded: true, topTenRanking: 2)
            MovieCell(isRecentlyAdded: false, topTenRanking: 10)
        }
    }
}
