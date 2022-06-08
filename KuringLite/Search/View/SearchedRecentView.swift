//
//  SearchedRecentList.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/06/07.
//

import SwiftUI
import KuringCommons

struct SearchedRecentList: View {
    
    @Binding var recentList: [String]
    init(recentList: Binding<[String]>) {
        _recentList = recentList
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(recentList, id: \.self) { text in
                    
                    HStack(spacing: 5) {
                        Text("\(text)")
                            .foregroundColor(ColorSet.Label.secondary.color)
                            .padding(.leading, 10)
                        
                        Button {
                            // remove Action
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(ColorSet.secondaryGray.color)
                        }

                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(ColorSet.secondaryGreen.color)
                        
                    )
                }
            }
            .padding(.leading, 20)
        }
    }
}

//struct SearchedRecentList_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchedRecentList()
//    }
//}
