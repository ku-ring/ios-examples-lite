//
//  SearchEngine.swift
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

/// 쿠링의 검색 관련 데이터를 관리하는 검색엔진 모델
class SearchEngine: ObservableObject {
    @AppStorage("com.kuring.lite.recent.search")
    var recentSearch: [String] = []
    
    @Published var searchText: String = ""
    
    @Published var currentType: Searcher.SearchType = .notice {
        didSet {
            resetResult()
            search()
        }
    }
    
    @Published var staffResult: [Staff] = []
    @Published var noticeResult: [Notice] = []
    
    var searcher: Searcher?
    
    func start() {
        searcher = Kuring.createSearcher(delegate: self)
        searcher?.connect()
    }
    
    func resetResult() {
        staffResult = []
        noticeResult = []
    }
    
    func search() {
        guard !searchText.isEmpty else {
            return resetResult()
        }
        if !recentSearch.contains(searchText) {
            recentSearch.append(searchText)
        }
        searcher?.search(searchText, forType: currentType)
    }
}

// MARK: SearcherDelegate
extension SearchEngine: SearcherDelegate {
    /// 서쳐의 연결 상태가 변경될 때마다 호출되는 이벤트 입니다.
    func searcher(_ searcher: Searcher, didChangeState state: Searcher.ConnectionState) {
        // NOTE: disconnected 일 때 연결상태가 불안정하다는 시스템 메세지를 보여줘야 하나?
    }
    
    /// 서쳐에서 에러가 발생할 때 호출되는 이벤트 입니다.
    func searcher(_ searcher: Searcher, didReceiveError error: Error?) {
        Logger.debug(error?.localizedDescription ?? "")
    }
    
    /// 서쳐에서 교직원 정보(`[Staff]`)를 가져왔을 때 호출 되는 이벤트 입니다.
    func searcher(_ searcher: Searcher, didReceiveStaffList staffs: [Staff]) {
        self.staffResult = staffs
    }
    
    /// 서쳐에서 공지 정보(`[Notice]`)를 가져왔을 때 호출 되는 이벤트 입니다.
    func searcher(_ searcher: Searcher, didReceiveNoticeList notices: [Notice]) {
        self.noticeResult = notices
    }
    
    /// 서처에서 웹소켓 연결 유지를 위해 30초마다 보내는 **heart beat** 가 서버로 전송 되었을 때 호출되는 이벤트 입니다.
    func searcherDidSendHeartbeat(_ searcher: Searcher) {
        // TODO: 주기적으로 핑 보내는지 확인 필요
        Logger.debug("didSendHeartbeat")
    }
}
