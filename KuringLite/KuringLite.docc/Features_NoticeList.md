# 공지사항 목록

공지사항 목록을 API 통신을 통해 가져와 뷰로 그릴 수 있습니다.

## 개요

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

## Topics

### 시작하기

- <doc:ProjectFoldersAndFiles>
- <doc:Features>
