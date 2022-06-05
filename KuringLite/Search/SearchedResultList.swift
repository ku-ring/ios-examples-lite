//
//  SearchedResultList.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI

struct SearchedResultList: View {
    @ObservedObject var engine: SearchEngine
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            switch engine.currentType {
            case .notice:
                ForEach(engine.noticeResult) { notice in
                    SearchedNoticeRow(notice: notice)
                }
            case .staff:
                ForEach(engine.staffResult, id: \.email) { staff in
                    SearchedStaffRow(staff: staff)
                }
            default:
                EmptyView()
            }
        }
    }
}
