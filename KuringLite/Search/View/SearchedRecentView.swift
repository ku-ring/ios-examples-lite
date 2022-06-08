//
//  SearchedRecentList.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/07.
//

import SwiftUI
import KuringCommons

struct SearchedRecentList: View {
    @EnvironmentObject private var engine: SearchEngine
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(engine.appStorageManager.recentSearch.reversed(), id: \.self) { text in
                    
                    HStack(spacing: 5) {
                        Text("\(text)")
                            .font(.system(size: 16))
                            .foregroundColor(ColorSet.Label.secondary.color)
                            .padding(.leading, 10)
                            .onTapGesture {
                                search(text)
                            }
                        
                        Button {
                            engine.remove(text: text)
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
        engine.appStorageManager.recentSearch.removeAll { String($0) == text }
        
        engine.searchText = text
        engine.inputText = text
    }
}
