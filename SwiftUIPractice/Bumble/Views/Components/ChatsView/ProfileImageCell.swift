//
//  ProfileImageCell.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct ProfileImageCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(.degrees(-90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
                
        }
        .frame(width: 75, height: 75)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
        }
    }
}

#Preview {
    VStack {
        ProfileImageCell(hasNewMessage: false)
        ProfileImageCell(percentageRemaining: 0.4, hasNewMessage: true)
        ProfileImageCell(percentageRemaining: 1, hasNewMessage: false)
        ProfileImageCell(percentageRemaining: 0, hasNewMessage: true)
    }
}
