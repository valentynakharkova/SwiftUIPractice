//
//  LaunchScreen.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 03.09.2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct LaunchScreen: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            Image("launch-screen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Text("SWIFTUI PRACTICE")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .background(.indigo.opacity(0.80))
                .cornerRadius(20)
                .asButton(.press) {
                    router.showScreen(.push) { _ in
                        ContentView()
                    }
                }
        }

    }
}

#Preview {
    RouterView { _ in
        LaunchScreen()
    }
}
