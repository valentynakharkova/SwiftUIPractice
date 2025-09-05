//
//  NetflixMovieDetailsViewModel.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import Foundation

@MainActor
final class NetflixMovieDetailsViewModel: ObservableObject {
    
    @Published var progress: Double = 0.5
    @Published var isMyList: Bool = false
    @Published var products: [Product] = []
    
    func getData() async {
        
        guard products.isEmpty else { return }
         
        do {
            products = try await DatabaseHelper().getProducts()
        } catch  {
            
        }
    }
}
