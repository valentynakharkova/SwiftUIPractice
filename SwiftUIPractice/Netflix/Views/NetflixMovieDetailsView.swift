//
//  NetflixMovieDetailsView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import SwiftUI

struct NetflixMovieDetailsView: View {
    
    @StateObject private var viewModel = NetflixMovieDetailsViewModel()
    
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        detailsProductSection
                        
                        
                    }
                    .padding(8)
                }
            }
        }
    }
    
    private var header: some View {
        DetailsHeaderView(
            imageName: product.firstImage,
            progress: viewModel.progress,
            onAirplayPressed: { },
            onXMarkPressed: { }
        )
    }
    
    private var detailsProductSection: some View {
        DetailsProductView(
            title: product.title,
            isNew: true,
            yearReleased: "2025",
            seasonCount: 3,
            hasClosedCaptions: true,
            isTopTen: 8,
            descriptionText: product.description,
            castText: "Aquaman, Wonder Woman, Superman, Batman, Flash, Cyborg, Green Lantern, Martian Manhunter",
            onPlayPressed: { },
            onDownloadPressed: { }
        )
    }
    
}

#Preview {
    NetflixMovieDetailsView()
}
