//
//  NoticeType.KuringLite.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import KuringSDK

extension NoticeType {
    var isSubscribed: Bool {
        Kuring.subscribedCategories.contains(self)
    }
}
