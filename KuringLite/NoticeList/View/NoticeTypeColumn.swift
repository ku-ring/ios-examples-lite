//
//  NoticeTypeColumn.swift
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

/// 하나의 공지 카테고리를 나타내는 아이템 뷰
struct NoticeTypeColumn: View {
    @ObservedObject var model: NoticeListModel
    let noticeType: NoticeType

    var body: some View {
        Text(noticeType.koreanValue)
            .font(.subheadline)
            .foregroundColor(
                noticeType == model.currentType
                ? ColorSet.Label.green.color
                : ColorSet.Label.primary.color
            )
            .padding(.horizontal, 16)
            .frame(height: 36)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(
                        noticeType == model.currentType
                        ? ColorSet.secondaryGreen.color
                        : Color.clear
                    )
            )
            .onTapGesture {
                model.currentType = noticeType
            }
    }
}
