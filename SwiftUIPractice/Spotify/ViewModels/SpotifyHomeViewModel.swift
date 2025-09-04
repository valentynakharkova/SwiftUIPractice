//
//  SpotifyHomeViewModel.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 02.09.2025.
//

import Foundation

class SpotifyHomeViewModel: ObservableObject {
    
    @Published var currentUser: User? = nil
    @Published var selectedCategory: Category? = nil
    @Published var products: [Product] = []
    @Published var productRows: [ProductRow] = []
    
    func getData() async {
        guard products.isEmpty else { return }
        
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0._brand }))
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
}
