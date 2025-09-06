//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 01.09.2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List {
            Text("Spotify")
                .foregroundStyle(.spotifyGreen)
                .asButton(.press) {
                    router.showScreen(.push) { _ in
                        SpotifyHomeView()
                    }
                }
            Text("Bumble")
                .foregroundStyle(.bumbleYellow)
                .asButton(.press) {
                    router.showScreen(.push) { _ in
                        BumbleHomeView()
                    }
                }
            Text("Netflix")
                .foregroundStyle(.netflixRed)
                .asButton(.press) {
                    router.showScreen(.push) { _ in
                        NetflixHomeView()
                    }
                }
        }
        .font(.headline)
        .navigationTitle("Go to:")
        
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
