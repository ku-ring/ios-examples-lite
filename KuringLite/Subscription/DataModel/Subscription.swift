//
//  Subscription.swift
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

/// 구독 데이터 모델
public class Subscription: ObservableObject {
    @Published var selectedNoticeTypes: [NoticeType] = NoticeType.allCases.filter { $0.isSubscribed }
    @Published var noticeTypes: [NoticeType] = NoticeType.allCases
    @Published var isUpdatable: Bool = false
    @Published var isSaved: Bool = false

    public func select(noticeType: NoticeType) {

        if isSelecting(noticeType) {
            selectedNoticeTypes.removeAll { $0 == noticeType }
        } else {
            selectedNoticeTypes.append(noticeType)
        }
        isUpdatable = true
    }

    public func isSelecting(_ noticeType: NoticeType) -> Bool {
        selectedNoticeTypes.contains(noticeType)
    }

    public func save() {
        let subscriptionList = selectedNoticeTypes.compactMap { $0.stringValue }
        // Remote
        Kuring.updateSubscription(categories: subscriptionList) { _ in }
        // Local
        Kuring.categoryStrings = subscriptionList

        isSaved = true
        isUpdatable = false
    }

    public func reset() {
        self.selectedNoticeTypes = NoticeType.allCases.filter { $0.isSubscribed }

        isUpdatable = false
    }
}
