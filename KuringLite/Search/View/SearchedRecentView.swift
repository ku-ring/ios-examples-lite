//
//  SearchedRecentList.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/07.
//

import SwiftUI
import KuringCommons

import SwiftUI
import KuringCommons

struct SearchedRecentList: View {
    @EnvironmentObject var engine: SearchEngine
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(engine.recentSearch.reversed(), id: \.self) { text in
                    
                    HStack(spacing: 5) {
                        Text("\(text)")
                            .font(.system(size: 16))
                            .foregroundColor(ColorSet.Label.secondary.color)
                            .padding(.leading, 10)
                            .onTapGesture {
                                search(text)
                            }
                        
                        Button {
                            engine.recentSearch.removeAll { String($0) == text }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(ColorSet.Label.green.color)
                                
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
    
    func search(_ text: String) {
        engine.recentSearch.removeAll { $0 == text }
        engine.searchText = text
        engine.recentSearch.append(text)
    }
}
