//
//  SubscriptionSelection.swift
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

/// 공지 카테고리들을 선택하는 공간을 나타내는 뷰로 카테고리들이 Grid 형태로 구성된다.
struct SubscriptionSelection: View {
    @ObservedObject var subscription: Subscription

    let columns = [
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60))
    ]

    var body: some View {
        VStack {
            // 카테고리 그룹 버튼
            HStack {
                Text("대학 공지 카테고리")
                    .font(.subheadline.weight(.semibold))

                Spacer()
            }

            // 구독 가능 카테고리 목록
            LazyVGrid(columns: columns) {
                ForEach(subscription.noticeTypes, id: \.self) { noticeType in
                    Button {
                        subscription.select(noticeType: noticeType)
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1)
                            .frame(height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(subscription.isSelecting(noticeType) ? .white : .clear)
                            )
                            .overlay(
                                Text(noticeType.koreanValue)
                                    .foregroundColor(
                                        subscription.isSelecting(noticeType)
                                        ? Color(red: 61 / 255, green: 189 / 255, blue: 128 / 255)
                                        : .white
                                    )
                            )
                    }
                }
            }
        }
        .padding(.vertical, 15)
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .background(
            Color.white.opacity(0.2)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        )
        .padding(.horizontal, 38)
        .clipped()
    }
}
