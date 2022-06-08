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
        ScrollView(.horizontal, showsIndicators: false) {
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
                            // FIXME: 데이터는 지워지나 View가 update되지 않는 현상 발생
                            // 원인: SearchView에서 바인딩 된 것들이 없어서 업데이트가 진행되지 않았음.
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
