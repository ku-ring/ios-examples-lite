//
//  NoticeList.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

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
