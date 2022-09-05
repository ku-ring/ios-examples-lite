//
//  SearchView.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

/**
 MIT License

 Copyright (c) 2022 쿠링

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import SwiftUI
import KuringSDK
import KuringCommons

/// 검색화면을 나타내는 뷰
struct SearchView: View {
    @StateObject private var engine = SearchEngine()

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(ColorSet.green.color)

                TextField("검색어를 입력해주세요", text: $engine.searchText)
            }
            .padding(.horizontal, 20)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(ColorSet.green.color, lineWidth: 1)
            )
            .padding(16)

            ScrollView(showsIndicators: false) {
                LazyVStack {
                    HStack(spacing: 10) {
                        ForEach(Searcher.SearchType.allCases, id: \.self) {
                            SearchTypeColumn(
                                engine: engine,
                                searchType: $0
                            )
                        }
                    }

                    SearchedResultList(engine: engine)
                }
            }
        }
        .onAppear { engine.start() }
        .onChange(of: engine.searchText) { _ in
            engine.search()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("🔍 검색하기")
            }
        }
    }
}
