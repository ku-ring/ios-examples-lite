//
//  SearchedStaffRow.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringSDK
import KuringCommons

struct SearchedStaffRow: View {
    let staff: Staff
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(staff.name)
                .font(.subheadline)
                .foregroundColor(ColorSet.Label.primary.color)
            
            Text("\(staff.deptName) · \(staff.collegeName)")
                .font(.caption)
                .foregroundColor(ColorSet.Label.secondary.color)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
    }
}
