//
//  SearchedRecentList.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/07.
//

import SwiftUI
import KuringCommons

struct SearchedRecentList: View {
    
    @Binding var recentList: [String]
    @Binding var searchText: String
    
    init(recentList: Binding<[String]>, searchText: Binding<String>) {
        _recentList = recentList
        _searchText = searchText
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(recentList, id: \.self) { text in
                    
                    HStack(spacing: 5) {
                        Text("\(text)")
                            .foregroundColor(ColorSet.Label.secondary.color)
                            .padding(.leading, 10)
                            .onTapGesture {
                                search(text)
                            }
                        
                        Button {
                            // remove Action
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(ColorSet.secondaryGray.color)
                        }

                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(ColorSet.secondaryGreen.color)
                        
                    )
                }
            }
            .padding(.leading, 20)
        }
    }
    
    private func search(_ text: String) {
        searchText = text
    }
}

//struct SearchedRecentList_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchedRecentList()
//    }
//}