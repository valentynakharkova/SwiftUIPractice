//
//  SpotifyPlaylistViewModel.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import Foundation

@MainActor
final class SpotifyPlaylistViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var showHeader: Bool = true
    
    
    func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}
