//
//  SearchedNoticeRow.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

struct SearchedNoticeRow: View {
    let notice: Notice
    
    var dateText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date(timeIntervalSince1970: notice.postedAt))
    }
    
    var body: some View {
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
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
    }
}
