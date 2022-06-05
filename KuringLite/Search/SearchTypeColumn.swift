//
//  SearchTypeColumn.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

struct SearchTypeColumn: View {
    @ObservedObject var engine: SearchEngine
    let searchType: Searcher.SearchType
    
    var body: some View {
        Text(searchType.koreanValue)
            .font(.subheadline)
            .foregroundColor(
                searchType == engine.currentType
                ? ColorSet.Label.green.color
                : ColorSet.Label.primary.color
            )
            .padding(.horizontal, 16)
            .frame(height: 36)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(
                        searchType == engine.currentType
                        ? ColorSet.secondaryGreen.color
                        : Color.clear
                    )
            )
            .onTapGesture {
                engine.currentType = searchType
            }
    }
}
