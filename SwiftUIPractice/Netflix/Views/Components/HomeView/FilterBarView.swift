//
//  FilterBarView.swift
//  SwiftUIPractice
//
//  Created by Valentyna Kharkova on 04.09.2025.
//

import SwiftUI


struct FilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFiltersPressed: ((FilterModel) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
             HStack {
                 if selectedFilter != nil {
                     Image(systemName: "xmark")
                         .padding(8)
                         .background {
                             Circle()
                                 .stroke(lineWidth: 1)
                         }
                         .foregroundStyle(.netflixLightGray)
                         .background(.black.opacity(0.0001))
                         .onTapGesture {
                             onXMarkPressed?()
                         }
                         .transition(AnyTransition.move(edge: .leading))
                         .padding(.leading, 16)
                 }
                
                 
                 ForEach(filters, id: \.self) { filter in
                     if selectedFilter == nil || selectedFilter == filter {
                         FilterCell(
                            title: filter.title ,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                         )
                         .background(.black.opacity(0.001))
                         .onTapGesture {
                             onFiltersPressed?(filter)
                         }
                         .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                     }
                     
                 }
             }
             .padding(.vertical, 4)
             .animation(.bouncy, value: selectedFilter)
        }
    }
}

fileprivate struct FilterBarViewPreview: View {
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        FilterBarView(
            filters: filters,
            selectedFilter: selectedFilter,
            onFiltersPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXMarkPressed: {
                selectedFilter = nil
            }
        )
    }
}

#Preview {
    ZStack {
        Color.netflixDarkRed.ignoresSafeArea()
        FilterBarViewPreview()
    }
}
