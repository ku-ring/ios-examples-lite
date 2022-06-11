//
//  Notice.KuringLite.swift
//  KuringLite
//
//  Created by Jaesung Lee on 2022/06/05.
//  Developed by Hamlit Jason on 2021/12/01.
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

import KuringSDK
import UIKit

extension Notice {
    enum NoticeURL {
        case original(_ articleID: String)
        case library(_ articleID: String)

        var urlString: String {
            switch self {
            case .original(let articleID):
                return "https://www.konkuk.ac.kr/do/MessageBoard/ArticleRead.do?id=\(articleID)"
            case .library(let articleID):
                return "https://library.konkuk.ac.kr/#/bbs/notice/\(articleID)"
            }
        }
    }

    var urlString: String {
        switch category {
        case .도서관 :
            return NoticeURL.library(articleID).urlString
        default:
            return NoticeURL.original(articleID).urlString
        }
    }
}
