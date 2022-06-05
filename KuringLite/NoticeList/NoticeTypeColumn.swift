//
//  NoticeTypeColumn.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

struct NoticeTypeColumn: View {
    @ObservedObject var model: NoticeListModel
    let noticeType: NoticeType
    
    var body: some View {
        Text(noticeType.koreanValue)
            .font(.subheadline)
            .foregroundColor(
                noticeType == model.currentType
                ? ColorSet.Label.green.color
                : ColorSet.Label.primary.color
            )
            .padding(.horizontal, 16)
            .frame(height: 36)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(
                        noticeType == model.currentType
                        ? ColorSet.secondaryGreen.color
                        : Color.clear
                    )
            )
            .onTapGesture {
                model.currentType = noticeType
            }
    }
}
