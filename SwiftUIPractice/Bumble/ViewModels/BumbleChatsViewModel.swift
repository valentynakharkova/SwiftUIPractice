//
//  BumbleChatsViewModel.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import Foundation

@MainActor
final class BumbleChatsViewModel: ObservableObject {
    
    @Published var allUsers: [User] = []
    
    func getData() async {
        
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
    
}

