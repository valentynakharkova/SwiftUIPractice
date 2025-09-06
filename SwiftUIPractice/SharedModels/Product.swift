//
//  Product.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 02.09.2025.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Double
    let discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let category, thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    var _brand: String {
        brand ?? ""
    }
    
    let recentlyAdded: Bool = {
        return Int.random(in: 1...4) == 1
    }()

    static var mock: Product {
        Product(
            id: 123,
            title: "Product Title",
            description: "This is an example description of product title for previews",
            price: 15.6,
            discountPercentage: 20,
            rating: 4.8,
            stock: 70,
            brand: "Loreal",
            category: "Beauty products",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage]
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}

