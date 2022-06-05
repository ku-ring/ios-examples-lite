//
//  SwiftPackageRow.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringCommons

struct SwiftPackage: Identifiable {
    var id: String { name }
    let name: String
    let urlString: String
    let version: String
    
    static let allUsed: [SwiftPackage] = [
        .init(name: "KuringSDK", urlString: "https://github.com/KU-Stacks/kuring-sdk-ios-spm", version: "1.2.1"),
        .init(name: "KuringCommons", urlString: "https://github.com/KU-Stacks/kuring-ios-commons", version: "1.0.2"),
        .init(name: "Lottie", urlString: "https://github.com/airbnb/lottie-ios", version: "3.3.0"),
        .init(name: "Starscream", urlString: "https://github.com/daltoniam/Starscream", version: "4.0.4"),
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
