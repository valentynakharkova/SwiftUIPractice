//
//  ShareButton.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import SwiftUI

struct ShareButton: View {
    
    var url: String = "https://www.linkedin.com/in/valentyna-kharkova/"
    
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                 
                    Image(systemName: "paperplane")
                        .font(.title)
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(.black.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        ShareButton()
    }
}
