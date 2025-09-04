//
//  NetflixHomeView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct NetflixHomeView: View {
    
    @StateObject private var viewModel = NetflixHomeViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    NetflixHomeView()
}
