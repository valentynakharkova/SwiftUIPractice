//
//  NetflixMovieDetailsView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import SwiftUI

struct NetflixMovieDetailsView: View {
    
    @StateObject private var viewModel = NetflixMovieDetailsViewModel()
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                
            }
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
