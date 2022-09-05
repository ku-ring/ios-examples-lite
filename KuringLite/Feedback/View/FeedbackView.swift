//
//  FeedbackView.swift
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
import KuringCommons

/// 피드백 화면을 나타내는 뷰
struct FeedbackView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var stateModel = FeedbackState()

    var body: some View {
        NavigationView {
            ZStack {
                ColorSet.Background.primary.color
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("피드백을 남겨서 앱이 성장 하는데에\n큰 기여를 해주세요 🙂")
                        .foregroundColor(ColorSet.Label.primary.color)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.top, 24)
                        .padding(.bottom, 32)

                    TextEditor(text: $stateModel.feedback)
                        .foregroundColor(stateModel.textEditorColor)
                        .font(.footnote)
                        .frame(maxHeight: 164)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(ColorSet.green.color, lineWidth: 1)
                                .foregroundColor(.clear)
                                .frame(maxHeight: 180)

                        )
                        .onTapGesture {
                            stateModel.startEditing()
                        }

                    HStack {
                        Spacer()

                        Text(stateModel.textLimitGuide)
                            .font(.caption)
                            .foregroundColor(stateModel.textLimitColor)
                    }

                    .padding(.bottom, 24)

                    Button(action: send) {
                        Text("피드백 보내기")
                            .foregroundColor(ColorSet.Background.primary.color)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundColor(ColorSet.green.color)
                                    .frame(height: 52)
                                    .frame(minWidth: 232)
                            )
                            .padding()
                    }
                    .opacity(stateModel.isSendable ? 1.0 : 0.5)
                    .disabled(!stateModel.isSendable)

                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("💬 피드백")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                hideKeyboard()
                stateModel.endEditing()
            }
        }
    }

    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    func send() {
        stateModel.send {
            presentationMode.wrappedValue.dismiss()
        }
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
