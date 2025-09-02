//
//  SpotifyHomeView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 01.09.2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
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
                if let currentUser = viewModel.currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
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
                            
                        }
                }
            }
        
    }
}

#Preview {
    SpotifyHomeView()
}
