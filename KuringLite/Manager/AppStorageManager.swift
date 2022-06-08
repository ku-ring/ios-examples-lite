//
//  AppStorageManager.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/08.
//

import SwiftUI

class AppStorageManager {
    static let shared = AppStorageManager()
    
    private init() { }
    
    @AppStorage(StringSet.recentSearch)
    var recentSearch: [String] = []
}
