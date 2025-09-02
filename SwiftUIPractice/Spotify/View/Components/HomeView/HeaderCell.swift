//
//  HeaderCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 02.09.2025.
//

import SwiftUI

struct HeaderCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)
            
    }
}

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? Color.spotifyGreen : Color.spotifyDarkGray)
            .foregroundStyle(isSelected ? Color.spotifyBlack : Color.spotifyWhite)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack(spacing: 10) {
            HeaderCell(title: "Title")
            HeaderCell(isSelected: true)
            HeaderCell(title: "Title goes here", isSelected: true)
        }
    }
}
