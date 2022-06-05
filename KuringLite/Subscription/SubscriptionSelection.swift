//
//  SubscriptionSelection.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI

struct SubscriptionSelection: View {
    @ObservedObject var subscription: Subscription
    
    let columns = [
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        VStack {
            // 카테고리 그룹 버튼
            HStack {
                Text("대학 공지 카테고리")
                    .font(.subheadline.weight(.semibold))
                
                Spacer()
            }
            
            // 구독 가능 카테고리 목록
            LazyVGrid(columns: columns) {
                ForEach(subscription.noticeTypes, id: \.self) { noticeType in
                    Button {
                        subscription.select(noticeType: noticeType)
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1)
                            .frame(height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(subscription.isSelecting(noticeType) ? .white : .clear)
                            )
                            .overlay(
                                Text(noticeType.koreanValue)
                                    .foregroundColor(
                                        subscription.isSelecting(noticeType)
                                        ? Color(red: 61 / 255, green: 189 / 255, blue: 128 / 255)
                                        : .white
                                    )
                            )
                    }
                }
            }
        }
        .padding(.vertical, 15)
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .background(
            Color.white.opacity(0.2)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        )
        .padding(.horizontal, 38)
        .clipped()
    }
}
