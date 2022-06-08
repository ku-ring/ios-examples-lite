//
//  AppStorageManager.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/08.
//

import SwiftUI

class AppStorageManager: ObservableObject {
    @AppStorage(StringSet.recentSearch)
    var recentSearch: [String] = UserDefaults.standard.array(forKey: StringSet.recentSearch) as? [String] ?? []
}
