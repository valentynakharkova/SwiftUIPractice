//
//  NetflixMovieDetailsView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct NetflixMovieDetailsView: View {
    
    @Environment(\.router) var router
    
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
                        buttonsSection
                        productsGridSection
                        
                    }
                    .padding(8)
                }
            }
        }
        .task {
            await viewModel.getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        DetailsHeaderView(
            imageName: product.firstImage,
            progress: viewModel.progress,
            onAirplayPressed: { },
            onXMarkPressed: {
                router.dismissScreen()
            }
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
    
    private var buttonsSection: some View {
        HStack(spacing: 32) {
            MyListButton(isMyList: viewModel.isMyList, onButtonPressed: {
                viewModel.isMyList.toggle()
            })
            RateButton { selection in
                
            }
            ShareButton()
        }
        .padding(.leading, 32)
    }
    
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More like this")
                .font(.headline)
                .foregroundStyle(.netflixWhite)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), alignment: .center, spacing: 8, pinnedViews: []) {
                ForEach(viewModel.products) { product in
                    MovieCell(
                        imageName: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    )
                    .onTapGesture {
                        onProductPressed(product: product)
                    }
                }
            }
        }
    }
    
    private func onProductPressed(product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(product: product)
        }
    }
}

#Preview {
    RouterView { _ in
        NetflixMovieDetailsView()
    }
}
