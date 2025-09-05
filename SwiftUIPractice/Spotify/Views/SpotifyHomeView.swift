//
//  SpotifyHomeView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 01.09.2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    
    @Environment(\.router) var router
    
    @StateObject private var viewModel = SpotifyHomeViewModel()
    
    var body: some View {
        
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 1, pinnedViews: .sectionHeaders) {
                    Section {
                        VStack(spacing: 16) {
                            recentsSection
                                .padding(.horizontal, 16)
                            
                            if let product = viewModel.products.first {
                                newReleaseSection(product: product)
                            }
                            
                            listRows
                            
                        }
                    } header: {
                        header
                    }
                }
                .padding(.top, 8)
            }
            .clipped()
        }
        .task {
            await viewModel.getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                // MARK: Returns screen back to Go to: List
                if let currentUser = viewModel.currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        HeaderCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == viewModel.selectedCategory
                        )
                        .onTapGesture {
                            viewModel.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: viewModel.products) { product in
            if let product {
                RecentsCell(imageName: product.firstImage, title: product.title)
                    .asButton(.press) {
                        goToPlaylistView(product: product)
                    }
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        NewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
                goToPlaylistView(product: product)
            },
            onPlayPressed: {
                goToPlaylistView(product: product)
            }
        )
    }
    
    private var listRows: some View {
        ForEach(viewModel.productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products.shuffled()) { product in
                            ImageTitleRowCell(
                                imageName: product.firstImage,
                                imageSize: 120,
                                title: product.title
                            )
                            .asButton(.press) {
                                goToPlaylistView(product: product)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func goToPlaylistView(product: Product) {
        guard let currentUser = viewModel.currentUser else { return }
        
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: currentUser)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
}
