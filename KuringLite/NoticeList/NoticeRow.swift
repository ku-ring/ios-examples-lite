//
//  NoticeRow.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

struct NoticeRow: View {
    let notice: Notice
    
    var dateText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date(timeIntervalSince1970: notice.postedAt))
    }
    
    var body: some View {
        HStack {
            // MARK: New notice marker
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 8, height: 8)
                .foregroundColor(
                    notice.isNew
                    ? notice.isSubscribed ? ColorSet.pink.color : ColorSet.gray.color
                    : .clear
                )
                .padding(.leading, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                // MARK: Title
                Text(notice.subject)
                    .font(.subheadline)
                    .lineLimit(2)
                
                HStack {
                    // MARK: Date
                    Text(dateText)
                        .foregroundColor(ColorSet.Label.secondary.color)
                        .font(.caption)
                    
                    // MARK: Tag
                    ForEach(notice.tags, id: \.self) {
                        Text($0)
                            .frame(height: 16)
                            .foregroundColor(ColorSet.Background.primary.color)
                            .font(.caption)
                            .padding(.horizontal, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(ColorSet.secondaryGray.color)
                            )
                        
                    }
                }
            }
            .padding(.trailing, 24)
        }
        .frame(minHeight: 56)
    }
}
