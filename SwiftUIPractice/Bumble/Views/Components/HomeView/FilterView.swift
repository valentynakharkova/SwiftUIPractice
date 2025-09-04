//
//  FilterView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI

struct FilterView: View {
    
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selection: String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct FilterViewPreview: View {
    
    @State private var selection = "Hello"
    var options: [String] = ["Everyone", "Trending", "Hello"]
    
    var body: some View {
        FilterView(options: options, selection: $selection)
    }
}

#Preview {
    FilterViewPreview()
        .padding()
}
