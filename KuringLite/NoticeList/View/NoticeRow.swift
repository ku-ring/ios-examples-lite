//
//  NoticeRow.swift
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

/// 하나의 공지사항에 대한 주요 정보를 보여주는 아이템 뷰
struct NoticeRow: View {
    let notice: Notice

    var dateText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date(timeIntervalSince1970: notice.postedAt))
    }

    var body: some View {
        HStack {
            // MARK: New notice marker
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 8, height: 8)
                .foregroundColor(
                    notice.isNew
                    ? notice.isSubscribed ? ColorSet.pink.color : ColorSet.gray.color
                    : .clear
                )
                .padding(.leading, 8)

            VStack(alignment: .leading, spacing: 8) {
                // MARK: Title
                Text(notice.subject)
                    .font(.subheadline)
                    .lineLimit(2)

                HStack {
                    // MARK: Date
                    Text(dateText)
                        .foregroundColor(ColorSet.Label.secondary.color)
                        .font(.caption)

                    // MARK: Tag
                    ForEach(notice.tags, id: \.self) {
                        Text($0)
                            .frame(height: 16)
                            .foregroundColor(ColorSet.Background.primary.color)
                            .font(.caption)
                            .padding(.horizontal, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(ColorSet.secondaryGray.color)
                            )

                    }
                }
            }
            .padding(.trailing, 24)
        }
        .frame(minHeight: 56)
    }
}
