//
//  SubscriptionView.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

/**
 MIT License

 Copyright (c) 2022 쿠링

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import SwiftUI

/// 공지 카테고리 구독 화면을 나타내는 뷰
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
