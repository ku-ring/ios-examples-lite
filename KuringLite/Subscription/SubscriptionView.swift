//
//  SubscriptionView.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI

struct SubscriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var subscription = Subscription()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 61 / 255, green: 189 / 255, blue: 128 / 255)
                    .ignoresSafeArea(.all)
                
                LazyVStack {
                    Image(systemName: "bell")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48)
                        .clipped()
                        .padding(.bottom, 24)
                    
                    Text("어떤 알림들을 받아보시겠습니까?\n알림 받고 싶은 카테고리를 선택해주세요.")
                        .font(.body.weight(.semibold))
                        .padding(.bottom, 20)
                    
                    SubscriptionSelection(subscription: subscription)
                }
                
            }
            .foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("푸시 알림 설정")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.white)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: subscription.reset) {
                        Image(systemName: "arrow.uturn.left")
                    }
                    .foregroundColor(.white)
                    .opacity(subscription.isUpdatable ? 1 : 0.5)
                    .disabled(!subscription.isUpdatable)
                    
                    Button(action: save) {
                        Image(systemName: "checkmark")
                    }
                    .foregroundColor(.white)
                    .opacity(subscription.isUpdatable ? 1 : 0.5)
                    .disabled(!subscription.isUpdatable)
                }
            }
        }
    }
    
    func save() {
        subscription.save()
        presentationMode.wrappedValue.dismiss()
    }
}
