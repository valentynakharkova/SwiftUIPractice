//
//  DetailsProductView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import SwiftUI

struct DetailsProductView: View {
    
    var title: String = "Movie Title"
    var isNew: Bool = true
    var yearReleased: String? = "2025"
    var seasonCount: Int? = 2
    var hasClosedCaptions: Bool = true
    var isTopTen: Int? = 6
    var descriptionText: String? = "This is description text for the title, it needs to be multiple lines."
    var castText: String? = "Cast: Valentyna, Alex, Max, Jason Momoa"
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                if let yearReleased {
                    Text("\(yearReleased)")
                }
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(.netflixLightGray)
            
            if let isTopTen {
                HStack(spacing: 8) {
                    topTenIcon
                    
                    Text("#\(isTopTen) in TV Shows Today")
                        .font(.headline)
                }
            }
            buttons
            
            Group {
                if let descriptionText {
                    Text(descriptionText)
                }
                
                if let castText {
                    Text("Cast: \(castText)")
                        .foregroundStyle(.netflixLightGray)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var topTenIcon: some View {
        Rectangle()
            .fill(.netflixRed)
            .frame(width: 28, height: 28)
            .overlay {
                VStack(spacing: -4) {
                    Text("TOP")
                        .fontWeight(.bold)
                        .font(.system(size: 8))
                    Text("10")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .offset(y: 1)
            }
    }
    
    private var buttons: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: "play.fill")
                Text("Play")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .foregroundStyle(.netflixDarkGray)
            .background(.netflixWhite)
            .cornerRadius(4)
            .asButton(.press) {
                onPlayPressed?()
            }
            
            HStack {
                Image(systemName: "arrow.down.to.line.alt")
                Text("Download")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .foregroundStyle(.netflixWhite)
            .background(.netflixDarkGray)
            .cornerRadius(4)
            .asButton(.press) {
                onDownloadPressed?()
            }
            
            
        }
        .font(.callout)
        .fontWeight(.medium)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack(spacing: 40) {
            DetailsProductView()
            DetailsProductView(isNew: false, seasonCount: nil, hasClosedCaptions: false, isTopTen: nil)
        }
    }
}
