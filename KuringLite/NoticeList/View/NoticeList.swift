//
//  NoticeList.swift
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

/// 공지 카테고리와 각 항목별 공지사항들을 보여주는 뷰
struct NoticeList: View {
    @StateObject private var model = NoticeListModel()

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(NoticeType.allCases, id: \.self) {
                        NoticeTypeColumn(
                            model: model,
                            noticeType: $0
                        )
                    }
                }
                .padding(.leading, 16)
            }
            .frame(height: 48)

            ZStack {
                List {
                    ForEach(model.currentNotices) { notice in
                        ZStack(alignment: .leading) {
                            Link(destination: URL(string: notice.urlString)!) {
                                EmptyView()
                            }
                            .opacity(0)

                            NoticeRow(notice: notice)
                        }
                        .onAppear {
                            // 마지막에 도달했을 때 공지 더 가져오기
                            if model.currentNotices.last == notice {
                                model.load()
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .onAppear { model.load() }

                if model.isLoading {
                    LottieView(filename: "lottieLoading")
                        .frame(width: 100, height: 100, alignment: .center)
                }
            }
        }
    }
}
