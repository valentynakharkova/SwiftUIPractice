//
//  NetflixHomeViewModel.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import Foundation

@MainActor
final class NetflixHomeViewModel: ObservableObject {
    
    @Published var filters = FilterModel.mockArray
    @Published var selectedFilter: FilterModel? = nil
    @Published var fullHeaderSize: CGSize = .zero
    @Published var scrollViewOffset: CGFloat = 0
    
    @Published var heroProduct: Product? = nil
    @Published var currentUser: User? = nil
    @Published var productRows: [ProductRow] = []
    
    func getData() async {
        guard productRows.isEmpty else { return }
        
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0._brand }))
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products.shuffled()))
            }
            print("Brands:", allBrands)
            print("Rows count:", rows.count)
            for row in rows {
                print("Row:", row.title, "Products:", row.products.count)
            }
            productRows = rows
        } catch {
            
        }
    }
}
