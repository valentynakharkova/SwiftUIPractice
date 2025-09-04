//
//  BumbleHomeViewModel.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import Foundation

class BumbleHomeViewModel: ObservableObject {
    

    @Published var filters: [String] = ["Everyone", "Trending"]
    @Published var allUsers: [User] = []
    @Published var selectedIndex: Int = 1
    @Published var cardOffsets: [Int: Bool] = [:] // // UserID : Direction Right = TRUE, Left = FALSE
    @Published var currentSwipeOffset: CGFloat = 0
    
    func getData() async {
        
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
    
}
