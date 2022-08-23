//
//  OrderedSet.KuringLite.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/12.
//

import Foundation
import OrderedCollections

extension OrderedSet: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode(OrderedSet<Element>.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
