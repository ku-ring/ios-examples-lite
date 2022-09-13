<p align="center">
 <img src="https://user-images.githubusercontent.com/53814741/163469327-98af5c02-efc7-4c3e-8fec-9195ca6805ad.JPG" width="30%"/>
 <img src="https://user-images.githubusercontent.com/53814741/163469357-aed6a78a-4b65-4a9a-bead-d541e7eee702.JPG" width="30%"/>
 <img src="https://user-images.githubusercontent.com/53814741/163469345-503b6b50-b240-4c8d-9656-c719a5f3d9f2.JPG" width="30%"/>
</p>


**🔔 걱정마, 쿠링이 알려줄게!** [👉🏽앱스토어 다운로드](https://apps.apple.com/kr/app/%EC%BF%A0%EB%A7%81/id1609873520)

# 쿠링Lite

<img src="https://user-images.githubusercontent.com/53814741/172047890-c135e050-7b5c-4478-9b8b-fda8b838634b.png" width="30%"/>

쿠링 Lite 는 모두가 자유롭게 쿠링 기능을 체험하고 기능 개발에 참여해볼 수 있는 오픈 프로젝트 입니다.

## 개요

쿠링 Lite 는 실제 서비스 되고 있는 **쿠링 - 건국대학교 공지앱** 의 주요 기능 일부만을 모아둔 오픈된 앱 프로젝트 입니다. 모두가 소스코드를 확인할 수 있으며, Xcode 및 연결된 실제 디바이스에서 앱을 구동시켜볼 수 있습니다.

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

> **KuringCommons**는 쿠링 앱에 사용되는 공통 UI 요소와 로깅에 대한 가이드를 제공하는 쿠링 iOS 만의 소프트웨어 개발 키트 입니다. 
>
> [👉🏼 깃헙 링크 바로가기](https://github.com/KU-Stacks/kuring-ios-commons)

### 기능

앱 프로젝트에서 제공하는 기능은 다음과 같습니다.

- 공지 카테고리 목록
- 공지 리스트 가져오기
- 공지 구독하기
- 공지 / 교직원 검색하기
- 피드백 전송하기

## 코드 스타일 가이드 | The Style Guidelines

모두가 다같이 참여할 수 있는 오픈 소스 프로젝트이기 때문에 가독성과 코드 이해도를 높이기 위해 다음의 스타일가이드에 따라서 코드를 작성해주세요.

[👉🏼 쿠링iOS 스타일가이드: 노션페이지에서 확인하기](https://www.notion.so/kuring/iOS-273caae65c484d6794481d5fb5a96d1d)

### 쿠링 iOS 스위프트 스타일 가이드 | Kuring iOS Swift Style Guidelines

- **라인수는 최대 100줄을 넘기지 않습니다.**
    
    > **왜?** 100줄이 넘어가면 가독성이 떨어집니다. 
    
    Xcode 👉🏻 Preferences 👉🏻 Text Editing 👉🏻 ✅ Page guide at column: 100
    
- **파일의 코드 수는 최대 300줄을 넘기지 않습니다.**
    
    기능에 따라 extension으로 나눠서 파일을 분리하도록 합니다.
    
- **파일명은 클래스 이름을 사용하고, extension의 경우 `*.SearcherDelegate.swift` 와 같이 기능을 명시합니다.**
    
    예) `SearchEngine.SearcherDelegate.swift`
    
- **프레임워크의 클래스에 extension을 넣는 경우 `*.KuringLite.swift` 와 같이 프로젝트명을 명시합니다**
    
    예) `View.KuringLite.swift`
    

#### 네이밍

- **1글자 네이밍 또는 약어만 사용하지 않습니다**
    
    ```swift
    // ⛔️ 이렇게 하면 안돼요!
    let btn = UIButton()
    
    // ✅ 이렇게 해주세요!
    let button = UIButton()
    let saveButton = UIButton()
    ```
    
    ```swift
    
    Kuring.someAsyncMethod(parameter1) { error in 
        // ⛔️ 이렇게 하면 안돼요!
        if let e = error { ... }
    
        // ✅ 이렇게 해주세요!
        if let error = error { ... }
    }
    ```
    
- **PascalCase(대문자로 시작)하는 경우는 오직 프로토콜, 타입(클래스, 구조체) 에서만 가능합니다. 그 외의 경우는 lowerCamelCase를 사용합니다.**
    
    ```swift
    protocol SomeDelegate: AnyObject {
        func someMethod(_ param: Type)
    }
    ```
    
- **약어의 경우 앞에 오는 경우를 제외하고 전부 대문자로 작성합니다.**
    
    ```swift
    // ⛔️ 이렇게 하면 안돼요!
    let httpUrl = URL(string: "https://")
    
    // ✅ 이렇게 해주세요!
    let httpURL = URL(string: "https://")
    let urlString = "https://"
    ```
    
- **Bool 타입은 `is + 형용사` 또는 `3인칭단수형` 동사를 사용합니다**
    
    다른 타입과 헷갈리지 않게 Boolean 타입임을 확실히 명시합니다.
    
    예) `isConnected`, `hasMember`, `showsNotice`
    
- **타입에 대한 힌트를 이름에 넣어야 합니다.**
    
    이름만 보고 어떤 역할을 하는지 짐작할 수 있도록 하여 가독성을 높일 수 있습니다.
    
    ```swift
    var saveButton: UIButton!
    var feedbackTextView: UITextView!
    var titleLabel: UILabel!
    
    struct SearchView: View { ... }
    ```
    
    **뷰에 대한 네이밍 시** 역할에 따라 다음의 네이밍 규칙을 **반드시** 준수해야합니다.
    
    ```swift
    // 리스트를 담당하는 뷰의 경우 `List` 명시
    struct NoticeList: View { ... }
    
    // 리스트의 아이템을 나타는 뷰의 경우 `Row` 명시
    struct NoticeRow: View { ... }
    
    // 좌우 스크롤 리스트의 아이템을 나타내는 뷰의 경우 `Column` 명시
    struct NoticeTypeColumn: View { ... }
    
    // 선택하는 아이템들의 집합을 나타내는 뷰의 경우 `Selection` 또는 `Selector` 명시
    struct SubscriptionSelection: View { ... }
    
    // 일반 뷰의 경우 `View` 명시
    struct FeedbackView: View { ... }
    ```


## PR 남기는 방법

현재 저장소를 fork 한 후 작업 내용을 fork 된 저장소에 푸시하고 본래의 저장소(현재 저장소)에 PR 을 생성해주세요,

The process for contributing to a public repository in GitHub starts by forking the repository, then pushing the change onto the forked, then creating a pull request onto the original repository. After that comes the role of the project owner to review and take action (merge/decline) of the requested code change.

## 이 프로젝트의 개발자

이 오픈 프로젝트는 쿠링 iOS 팀에 의해 운영관리 됩니다.
