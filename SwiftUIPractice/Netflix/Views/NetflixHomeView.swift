//
//  NetflixHomeView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct NetflixHomeView: View {
    
    @Environment(\.router) var router
    
    @StateObject private var viewModel = NetflixHomeViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            backgroundGradientLayer
            scrollViewLayer
            fullHeaderWithFilter
            
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await viewModel.getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var backgroundGradientLayer: some View {
        ZStack {
            LinearGradient(
                colors: [.netflixDarkGray.opacity(1), .netflixDarkGray.opacity(0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            LinearGradient(
                colors: [.netflixDarkRed.opacity(0.5), .netflixDarkRed.opacity(0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .frame(maxHeight: max(10, (400 + (viewModel.scrollViewOffset * 0.75))))
        .opacity(viewModel.scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: viewModel.scrollViewOffset)
    }
    
    private var scrollViewLayer: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false,
            content: {
                VStack(spacing: 8) {
                    
                    Rectangle()
                        .opacity(0)
                        .frame(height: viewModel.fullHeaderSize.height)
                    
                    if let heroProduct = viewModel.heroProduct {
                        heroCell(product: heroProduct)
                    }
                    
                    categoryRows
                }
            },
            onScrollChanged: { offset in
                viewModel.scrollViewOffset = min(0, offset.y)
            }
        )
    }
    
    private var header: some View {
        
        HStack(spacing: 0) {
            
            // MARK: Returns screen back to Go to: List
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .onTapGesture {
                    router.dismissScreen()
                }
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
    
    private var fullHeaderWithFilter: some View {
        VStack(spacing: 0) {
            header
                .padding(.horizontal, 16)
            
            if viewModel.scrollViewOffset > -20 {
                FilterBarView(
                    filters: viewModel.filters,
                    selectedFilter: viewModel.selectedFilter,
                    onFiltersPressed: { newFilter in
                        viewModel.selectedFilter = newFilter
                    },
                    onXMarkPressed: {
                        viewModel.selectedFilter = nil
                    }
                )
                .padding(.top, 16)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding(.bottom, 8)
        .background {
            ZStack {
                if viewModel.scrollViewOffset < -70 {
                    Rectangle()
                        .fill(.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.2)
                        .ignoresSafeArea()
                }
            }
        }
        .animation(.smooth, value: viewModel.scrollViewOffset)
        .readingFrame { frame in
            if viewModel.fullHeaderSize == .zero {
                viewModel.fullHeaderSize = frame.size
            }
        }
    }
    
    private func heroCell(product: Product) -> some View {
        HeroCell(
            imageName: product.firstImage,
            isNetflixFilm: true,
            title: product.title,
            categories: [product.category.capitalized, product._brand],
            onBackgroundPressed: {
                onProductPressed(product: product)
            },
            onPlayPressed: {
                onProductPressed(product: product)
            },
            onMyListPressed: {
                onProductPressed(product: product)
            }
        )
    }
    
    private var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(viewModel.productRows.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: 6) {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id: \.offset) { (index, product) in
                                MovieCell(
                                    imageName: product.firstImage,
                                    title: product.title,
                                    isRecentlyAdded: product.recentlyAdded,
                                    topTenRanking: rowIndex == 1 ? (index + 1) : nil
                                )
                                .onTapGesture {
                                    onProductPressed(product: product)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
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
        NetflixHomeView()
    }
}
