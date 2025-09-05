//
//  DetailsHeaderView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 05.09.2025.
//

import SwiftUI
import SwiftfulUI

struct DetailsHeaderView: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.7
    var onAirplayPressed: (() -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGray,
                foregroundColor: .netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
            HStack(spacing: 8) {
                Circle()
                    .fill(.netflixDarkGray)
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image(systemName: "tv.badge.wifi")
                            .offset(y: 1)
                    }
                    .onTapGesture {
                        onAirplayPressed?()
                    }
                
                Circle()
                    .fill(.netflixDarkGray)
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image(systemName: "xmark")
                            .offset(y: 1)
                    }
                    .onTapGesture {
                        onXMarkPressed?()
                    }
            }
            .foregroundStyle(.netflixWhite)
            .font(.subheadline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(8)
            
            
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        DetailsHeaderView()
    }
}
