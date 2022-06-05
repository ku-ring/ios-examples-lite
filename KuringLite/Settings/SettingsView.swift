//
//  SettingsView.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringCommons

struct SettingsView: View {
    @State private var showsSubscription: Bool = false
    @State private var showsFeedbackView: Bool = false
    
    var body: some View {
        List {
            Section {
                Button(action: { showsSubscription.toggle() }) {
                    HStack {
                        Text("🗞 공지 구독하기")
                            .font(.subheadline)

                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(ColorSet.Label.tertiary.color)
                    }
                }
                .foregroundColor(ColorSet.Label.primary.color)
            } header: {
                Text("공지구독")
            }

            Section {
                Button(action: { showsFeedbackView.toggle() }) {
                    HStack {
                        Text("💬 피드백 보내기")
                            .font(.subheadline)

                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(ColorSet.Label.tertiary.color)
                    }
                }
                .foregroundColor(ColorSet.Label.primary.color)
            } header: {
                Text("피드백")
            }

            Section {
                ForEach(SwiftPackage.allUsed) {
                    SwiftPackageRow(package: $0)
                }
            } header: {
                Text("사용된 스위프트 패키지")
            }
        }
        .sheet(isPresented: $showsSubscription) {
            SubscriptionView()
        }
        .sheet(isPresented: $showsFeedbackView) {
            FeedbackView()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("👋 더보기")
            }
        }
    }
}
