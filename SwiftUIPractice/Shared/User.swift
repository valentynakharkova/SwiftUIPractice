//
//  User.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 02.09.2025.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
    static var mock: User {
        User(
            id: 123,
            firstName: "Valentyna",
            lastName: "Kharkova",
            email: "gerry29072001@gmail.com",
            phone: "+380994477653",
            username: "Val",
            password: "jabhdhasjbfhj",
            image: Constants.randomImage,
            height: 180,
            weight: 80
        )
    }
}
