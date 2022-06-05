//
//  FeedbackView.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//

import SwiftUI
import KuringCommons

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
