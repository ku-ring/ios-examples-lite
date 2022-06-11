//
//  FeedbackState.swift
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
import KuringSDK
import KuringCommons

/// 피드백 진행 상태를 관리하는 데이터모델
class FeedbackState: ObservableObject {
    @Published var feedback: String {
        didSet { updateStates() }
    }
    @Published private(set) var textLimitGuide: String
    @Published private(set) var isSendable: Bool = false
    @Published private(set) var isOverTextLimit: Bool = false
    @Published private(set) var textEditorColor: Color = ColorSet.Label.tertiary.color
    @Published private(set) var textLimitColor: Color = ColorSet.Label.secondary.color

    let placeholder = "피드백을 남겨주세요"
    let textLimit: (min: Int, max: Int) = (min: 5, max: 256)

    init() {
        feedback = placeholder
        textLimitGuide = "\(textLimit.min)글자 이상 입력해주세요"
    }

    func send(onComplete: @escaping () -> Void) {
        guard !feedback.isEmpty, feedback != placeholder else { return }
        guard isSendable else { return }
        Kuring.sendFeedback(feedback) { [weak self] result in
            guard let self = self else { return }
            // 전송 완료 시 결과와 상관 없이 `feedback`를 활성화 시킵니다.
            self.feedback = self.placeholder

            switch result {
            case .success: break
            case .failure(let error): Logger.debug(error.localizedDescription)
            }
            onComplete()
        }
        isSendable = false
    }

    private func updateStates() {
        isSendable = feedback != placeholder
            && feedback.count >= textLimit.min
            && feedback.count <= textLimit.max
        textLimitGuide = feedback.count < textLimit.min || feedback == placeholder
            ? "\(textLimit.min)글자 이상 입력해주세요"
            : "글자수: \(feedback.count) / \(textLimit.max)"
        isOverTextLimit = feedback.count > textLimit.max
        textLimitColor = isOverTextLimit
            ? ColorSet.pink.color
            : ColorSet.Label.secondary.color
    }

    func endEditing() {
        if feedback.isEmpty {
            feedback = placeholder
            textEditorColor = ColorSet.Label.tertiary.color
        }
    }

    func startEditing() {
        if feedback == placeholder {
            feedback = ""
            textEditorColor = ColorSet.Label.primary.color
        }
    }
}
