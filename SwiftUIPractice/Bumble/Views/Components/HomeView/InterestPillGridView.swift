//
//  InterestPillGridView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    let iconName: String?
    let emoji: String?
    let text: String
}

struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    InterestPillGridView()
}
