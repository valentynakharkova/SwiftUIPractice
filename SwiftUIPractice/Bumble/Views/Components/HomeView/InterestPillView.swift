//
//  InterestPillView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct InterestPillView: View {
    
    var iconName: String? = "heart.fill"
    var emoji: String? = "🥰"
    var text: String = "Graguation"
    
    var body: some View {
            
        HStack(spacing: 4 ) {
                if let iconName {
                    Image(systemName: iconName)
                } else if let emoji {
                    Text(emoji)
                }
                
                Text(text)
            }
            .font(.callout)
            .fontWeight(.medium)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .foregroundStyle(.bumbleBlack)
            .background(.bumbleLightYellow)
            .cornerRadius(32)
    }
}

#Preview {
    InterestPillView()
}
