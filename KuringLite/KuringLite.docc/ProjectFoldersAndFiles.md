# 프로젝트 구성

쿠링 Lite 프로젝트의 파일들은 어떻게 그룹지어 있는지, 프로젝트가 어떤 구조로 구성되어 있는지 알아봅니다.

## 개요

프로젝트 파일들은 아래 경로와 같이 구성되어 있습니다.

* KuringLite (프로젝트 상위폴더)
  * KuringLiteApp.swift
  * ContentView.swift
  * 📁 기능1
    * 기능1을 위한 뷰1
    * 기능1을 위한 뷰2
    * 기능1을 위한 데이터모델1
  * 📁 기능2
    * 기능2을 위한 뷰1
    * 기능2을 위한 뷰2
    * 기능2을 위한 데이터모델1
  * 🏞 Assets

프로젝트는 Apple의 SwiftUI 기반이며 Apple 의 SwiftUI 공식 문서 가이드에 따라 각 기능들은 아래와 같은 공통적인 구조로 구성되었습니다.
- **View(뷰)** 
  
  실제 UI에 대한 묘사를 담고 있는 구성요소 입니다. `View` 프로토콜을 상속합니다.

  ```swift
  struct NoticeList: View {
      var body: some View { ... }
  }
  ```


- **[DataModel(데이터모델)](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app)** 
  
  뷰에서 사용되는 데이터들을 관리하기 위한 데이터모델입니다. `ObservableObject` 프로토콜을 상속하며 `@StateObject`, `@ObservedObject`, `@EnvironmentObject` 와 같은 속성과 함께 사용하여 뷰를 위한 데이터를 관리합니다.

  ```swift
  class NoticeListModel: ObservableObject { ... }

  struct NoticeList: View {
      @StateObject private var model = NoticeListModel()
  }
  ```

## Topics

### 주요 기능

- <doc:Features>
- <doc:Features_NoticeList>
