//
//  SwiftPackageRow.swift
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

/// 사용되고 있는 스위프트 패키지들에 대하여 하나의 스위프트 패키지에 대한 정보를 제공하는 아이템 뷰
struct SwiftPackage: Identifiable {
    var id: String { name }
    let name: String
    let urlString: String
    let version: String

    static let allUsed: [SwiftPackage] = [
        .init(name: "KuringSDK", urlString: "https://github.com/KU-Stacks/kuring-sdk-ios-spm", version: "1.2.1"),
        .init(name: "KuringCommons", urlString: "https://github.com/KU-Stacks/kuring-ios-commons", version: "1.0.2"),
        .init(name: "Lottie", urlString: "https://github.com/airbnb/lottie-ios", version: "3.3.0"),
        .init(name: "Starscream", urlString: "https://github.com/daltoniam/Starscream", version: "4.0.4")
    ]
}

struct SwiftPackageRow: View {
    let package: SwiftPackage
    var body: some View {
        ZStack {
            Link(destination: URL(string: package.urlString)!) {
                EmptyView()
            }
            .opacity(0)

            HStack {
                Text("🏛 \(package.name)")
                    .font(.subheadline)
                    .foregroundColor(ColorSet.Label.primary.color)

                Spacer()

                Text(package.version)
                    .font(.caption)
                    .foregroundColor(ColorSet.Label.secondary.color)
            }
        }
    }
}
