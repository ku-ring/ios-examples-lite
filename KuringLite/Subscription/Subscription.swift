//
//  Subscription.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

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

