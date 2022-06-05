//
//  ContentView.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringCommons

struct ContentView: View {
    @State private var showsSubscriptionView: Bool = false
    
    var body: some View {
        NavigationView {
            NoticeList()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Image("app.icon.label.horizontal")
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: { showsSubscriptionView.toggle() }) {
                            Image(systemName: "checklist")
                        }
                        
                        NavigationLink {
                            SearchView()
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }

                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                }
                .sheet(isPresented: $showsSubscriptionView) {
                    SubscriptionView()
                }
        }
    }
}
