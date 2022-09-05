//
//  SettingsView.swift
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
import KuringCommons

/// 더보기 화면을 나타내는 뷰
struct SettingsView: View {
    @State private var showsSubscription: Bool = false
    @State private var showsFeedbackView: Bool = false

    var body: some View {
        List {
            Section {
                Button(action: { showsSubscription.toggle() }) {
                    HStack {
                        Text("🗞 공지 구독하기")
                            .font(.subheadline)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(ColorSet.Label.tertiary.color)
                    }
                }
                .foregroundColor(ColorSet.Label.primary.color)
            } header: {
                Text("공지구독")
            }

            Section {
                Button(action: { showsFeedbackView.toggle() }) {
                    HStack {
                        Text("💬 피드백 보내기")
                            .font(.subheadline)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(ColorSet.Label.tertiary.color)
                    }
                }
                .foregroundColor(ColorSet.Label.primary.color)
            } header: {
                Text("피드백")
            }

            Section {
                ForEach(SwiftPackage.allUsed) {
                    SwiftPackageRow(package: $0)
                }
            } header: {
                Text("사용된 스위프트 패키지")
            }
        }
        .sheet(isPresented: $showsSubscription) {
            SubscriptionView()
        }
        .sheet(isPresented: $showsFeedbackView) {
            FeedbackView()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("👋 더보기")
            }
        }
    }
}
