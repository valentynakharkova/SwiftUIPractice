//
//  FilterCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct FilterCell: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = false
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .foregroundStyle(.netflixLightGray)
        .background {
            ZStack {
                Capsule(style: .circular)
                    .fill(.netflixDarkGray)
                    .opacity(isSelected ? 1 : 0)
                
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
                
            }
        }
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.netflixDarkRed.ignoresSafeArea()
        VStack {
            FilterCell(isDropdown: true)
            FilterCell(isSelected: true)
            FilterCell()
        }
    }
}
