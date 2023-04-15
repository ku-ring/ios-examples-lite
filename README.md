<p align="center">
 <img src="https://user-images.githubusercontent.com/53814741/163469327-98af5c02-efc7-4c3e-8fec-9195ca6805ad.JPG" width="30%"/>
 <img src="https://user-images.githubusercontent.com/53814741/163469357-aed6a78a-4b65-4a9a-bead-d541e7eee702.JPG" width="30%"/>
 <img src="https://user-images.githubusercontent.com/53814741/163469345-503b6b50-b240-4c8d-9656-c719a5f3d9f2.JPG" width="30%"/>
</p>


**🔔 걱정마, 쿠링이 알려줄게!** [👉🏽앱스토어 다운로드](https://apps.apple.com/kr/app/%EC%BF%A0%EB%A7%81/id1609873520)

# 쿠링Lite

<img src="https://user-images.githubusercontent.com/53814741/172047890-c135e050-7b5c-4478-9b8b-fda8b838634b.png" width="30%"/>

쿠링 Lite 는 모두가 자유롭게 쿠링 기능을 체험하고 기능 개발에 참여해볼 수 있는 오픈 프로젝트 입니다. [🔗 필독링크](https://github.com/KU-Stacks/kuring-lite-ios/discussions)

## 개요

쿠링 Lite 는 실제 서비스 되고 있는 **쿠링 - 건국대학교 공지앱** 의 주요 기능 일부만을 모아둔 오픈된 앱 프로젝트 입니다. 모두가 소스코드를 확인할 수 있으며, Xcode 및 연결된 실제 디바이스에서 앱을 구동시켜볼 수 있습니다.

### PR 남기는 방법

현재 저장소를 fork 한 후 작업 내용을 fork 된 저장소에 푸시하고 본래의 저장소(현재 저장소)에 PR 을 생성해주세요,

The process for contributing to a public repository in GitHub starts by forking the repository, then pushing the change onto the forked, then creating a pull request onto the original repository. After that comes the role of the project owner to review and take action (merge/decline) of the requested code change.

### 이 프로젝트의 개발자

이 오픈 프로젝트는 쿠링 iOS 팀에 의해 운영관리 됩니다.

### 개발환경

앱 프로젝트의 개발환경은 다음과 같습니다. 

- SwiftUI 기반
- iOS 15 이상
- Xcode 13.1 이상
- Swift 5.6 이상

### 사용되는 스위프트 패키지

앱 프로젝트에 사용되는 스위프트 패키지는 다음과 같습니다.

- KuringSDK 1.2.1 이상
- KuringCommons 1.0.2 이상
- Lottie 3.3.0
- Starscream 4.0.4

> **KuringSDK**(이하 쿠링SDK)는 쿠링 앱 기능을 모아둔 쿠링 iOS 만의 소프트웨어 개발 키트 입니다. 로컬 저장소 관리, API 통신 관리, 모델 정의, 앱 기능 구현에 필요한 다양한 퍼블릭 인터페이스 등 여러가지 개발 도구를 제공합니다. 개발 문서는 [여기에서](https://ku-stacks.github.io/kuring-lite-ios/documentation/kuringsdk/) 확인할 수 있습니다.
>
> [👉🏼 깃헙 링크 바로가기](https://github.com/KU-Stacks/kuring-sdk-ios-spm) 

> **KuringCommons**는 쿠링 앱에 사용되는 공통 UI 요소와 로깅에 대한 가이드를 제공하는 쿠링 iOS 만의 소프트웨어 개발 키트 입니다. 디자인 가이드 및 개발 문서는 [여기에서](https://ku-stacks.github.io/kuring-ios-commons/documentation/kuringcommons/) 확인할 수 있습니다.
>
> [👉🏼 깃헙 링크 바로가기](https://github.com/KU-Stacks/kuring-ios-commons)

## 프로젝트 구성

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

## 기능

쿠링 Lite가 제공하는 주요 기능은 다음과 같습니다.

> **참고** 이 항목은 쿠링 Lite 1.0.0 버전 기준으로 작성되었습니다. 1.0.0 이후의 변경사항들은 [Release Note](https://github.com/KU-Stacks/kuring-lite-ios/releases)를 확인해주세요.

- 공지 카테고리 목록
- 공지 리스트 가져오기
- 공지 구독하기
- 공지 / 교직원 검색하기
- 피드백 전송하기

### 공지사항 목록

`NoticeList` 는 공지사항 목록을 나타내는 **뷰** 이며 `NoticeTypeColumn` 과 `NoticeRow` 로 구성되어 있습니다. 그리고 `NoticeListModel` 이라는 데이터모델이 API 통신을 통해 공지사항 데이터들을 관리합니다. 

### 용어 정리

**Notice**

공지사항 그 자체를 의미 합니다. 

| 프로퍼티 | 용도 |
| --- | --- |
| `articleID` | 공지사항 고유번호로 URL 주소에 쓰입니다. 또한 공지사항들 간의 식별자로 사용됩니다 |
| `subject` | 공지사항 제목 |
| `category` | 공지 카테고리 |
| `urlString` | URL 주소 값 |
| `postedAt` | 공지 게시시간 정보. 1970년 1월 1일 기준 값 |
| `tags` | 공지 제목에서 추출한 태그 값들 |
| `isNew` | 마지막 접속 이후 새로 올라온 공지인지 여부 |
| `isRead` | 공지를 읽었는지 여부 |
| `isSubscribed` | 구독한 카테고리에 속하는 공지인지 여부 |

**NoticeType**

학사, 국제, 장학, 취창업 등 공지사항의 카테고리 항목을 의미합니다. 공지사항의 타입임을 나타내기 위해 사용된 네이밍 입니다.

> **🙋 질문: 왜 Category 라는 네이밍을 쓰지 않나요?** 이미 애플이 쓰고 있어요... [ Developer Documentation](https://developer.apple.com/documentation/objectivec/category)

NoticeType 객체들은 각각의 한글명을 나타내는 `.koreanValue` 라는 프로퍼티를 갖고 있습니다.

### NoticeList

<img width="393" alt="Screen Shot 2022-06-05 at 11 24 36 PM" src="https://user-images.githubusercontent.com/53814741/172055311-9d77fcb5-49a7-43f3-8eb1-e6122a5ca9f1.png">

카테고리별 공지사항 목록을 보여주는 뷰 입니다.

```swift
struct NoticeList: View {
    @StateObject var model = NoticeListModel()

    var body: some View {
        VStack {
            // 공지 카테고리
            ScrollView {
                LazyHStack {
                    ForEach { NoticeTypeColumn(...) }
                }
            }

            // 공지 리스트
            List {
                ForEach { NoticeRow(...) }
            }    
        }
    }
}
```

### NoticeTypeColumn

<img width="352" alt="Screen Shot 2022-06-05 at 11 25 12 PM" src="https://user-images.githubusercontent.com/53814741/172055334-012744f1-a819-4051-bbd6-95611fc20717.png">

하나의 공지사항 카테고리 항목 (`NoticeType`)을 나타내는 아이템 뷰입니다.

### NoticeRow

<img width="370" alt="Screen Shot 2022-06-05 at 11 25 31 PM" src="https://user-images.githubusercontent.com/53814741/172055347-a0838a09-09fd-45fb-aa78-b93225657b4c.png">

공지사항 목록을 구성하는 각각의 아이템 뷰로, 하나의 공지사항에 대한 주요 정보를 제공합니다.


## 코드 스타일 가이드 | The Style Guidelines

모두가 다같이 참여할 수 있는 오픈 소스 프로젝트이기 때문에 가독성과 코드 이해도를 높이기 위해 다음의 스타일가이드에 따라서 코드를 작성해주세요.

[👉🏼 쿠링iOS 스타일가이드](https://github.com/KU-Stacks/kuring-lite-ios/wiki/%EC%BF%A0%EB%A7%81-iOS-%EC%8A%A4%ED%83%80%EC%9D%BC-%EA%B0%80%EC%9D%B4%EB%93%9C)

