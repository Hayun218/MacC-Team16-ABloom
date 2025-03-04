# MERY (23.09. ~ )

예비 신혼 부부를 위한 ‘썸원’

예비 신혼 부부를 위한 문답 어플리케이션으로, ‘썸원’과 비교하여 질문을 선택하여 진행하고 현실을 반영한 질문으로 구성되어 있습니다. 
Apple Developer Academy @Postech 마지막 프로젝트로 시작하여 교육 수료 이후에도 진행되고 있으며, 
2명의 기획자 3명의 iOS 개발자로 시작한 후 현재 디자이너 1명, AOS 개발자 2명을 추가 영입하였습니다. 
현재 스프린트 5까지 진행되었으며, iOS는 배포되어 개선중이고 AOS도 배포 되었습니다.

[MERY 앱스토어](https://apps.apple.com/kr/app/%EB%A9%94%EB%A6%AC-mery/id6470876703)

![이전 온보딩뷰](https://github.com/user-attachments/assets/60a6e9f1-4479-4178-9891-6597783e6c2e)


## 👩🏻‍💻내가 기여한 부분

‘유저’ 즉, 사용자를 위한 어플리케이션 제작이라는 목표를 가지고 
아이디어 선정부터 검증 및 발전하여 개발까지 진행하였습니다. 

### 아이디어 선정 및 검증

- 고스트 프로토콜, 패스트팔로워, 트랜드, 기존 아이디어 피봇 등 다양한 전략을 활용한 아이디어 도출
    - 각 아이디어 별 실제 문제 혹은 기회 정리
- **랜딩 페이지 및 사전 신청 페이지를 배포**하여 사용자의 의견을 빠르게 들을 수 있도록 함
    - 노션 배포 서비스(우피)와 설문조사 서비스(스모어) 활용

### 컴포넌트 구성 담당

- 재활용되는 컴포넌트(버튼, 챗버블, 이미지, 폰트 등) 구현 담당
- 버전이 업그레이드 되면서 전체 디자인과 레이아웃이 바뀜에 따라 폐기된 컴포넌트 다수 존재


### 담당 화면 iOS 구현

- v2.0.0 온보딩 화면 구현
- v1, v2의 질문 선택 화면의 로직 및 화면 구현
    - 카테고리선택화면: 오늘의 추천 질문 로직 구현 및 카테고리 분류
    - 질문선택화면: 해당 카테고리로 이동하여, 답변 완료 된 질문 제외 질문 리스트
        - 로그인 안되어 있을 시, 제일 우측과 같이 질문 전체를 볼 수 없도록 막기
     
- 답변 작성 화면 로직 및 화면 구현
    - 답변의 문자가 150자 이상일 경우, 작성은 가능하나 저장 버튼 비활성화
    - ‘완료’ 버튼 누를 시, 메인 화면으로 복귀되고, 데이터는 Firebase에 저장
 
![답변작성화면](https://github.com/user-attachments/assets/57b826c6-7312-4f0b-8730-3f8c5fb94d8b)


### Firebase 실시간 데이터 활용

- Firebase 실시가 데이터를 통한 담당 화면에 맞춘 CRUD 구현
- Firebase로 데이터베이스를 설계하여 각 필드를 화면에서 적절히 활용
    - `SnapshotListener` 를 통해 서버 호출을 최소화시키면서 실시간 데이터 변화를 감지할 수 있도록 함

### FCM 토큰을 활용한 알림 서비스 구현

- FCM 토큰을 발급받아 실시간 데이터 변형에 따른 알림 서비스 java script로 구현
    1. ‘나’와 ‘상대방’이 처음 연결되었을 때, ‘상대방’에게 알림 전송
    2. ‘나’가 문답을 작성했을 때, ‘상대방’에게 특정 문답이 작성되었음을 알림
        - 알림을 클릭시 해당 문답 확인 화면으로 넘어감
    3. ‘상대방’이 문답을 작성하고 반응을 남겼을 때, ‘나’에게 반응 요청 알림
    4. ‘나’의 반응에 따라서, 완성 알림 혹은 반응 남겼음을 알리는 알림
- SwiftUI 내부 코드에서 매일 오전 9시마다 추천 알림 확인 알림 발송
- Firebase Function을 활용해 서버의 기능을 대체

## 🍀 배운점

### [Soft Skill]

- 사용자의 관점에서 이해하고 서비스를 바라보는 사고 확장
- 팀의 전체 프로세스에서 협업을 이루고, 갈등상황을 때에 따라 해결할 수 있는 능력
- 매 스프린트마다 진행되는 팀 피드백(KPT)을 통해 개인이 아닌 팀의 개선을 위해 생각할 수 있는 관점 키우기

### [Hard Skill]

- 아이디어 개발 전 사용자에게 다가갈 수 있는 방안 익힘 → 랜딩 페이지, 사전 신청 페이지 제작
- CSS, KPT와 같은 피드백 프로세스에 대한 이해도 향상
- v1 과 v2 사이 디자인 구성이 바뀌면서, 새로운 어플리케이션으로 탈바꿈 ⇒ 화면 구현 익힘
    - v1은 탭 3개로 구성되었으나, v2는 탭을 없애고 모달뷰로 전환시킴 (트랜드 분석 결과)
- Firebase `SnapshotListener` 도입으로 기존 화면이 그려질 때마다 호출 되었던 코드를 효율적으로 구성
- FCM 토큰과 Firebase function을 활용한 데이터에 따른 알림 기능
- 효율적인 GitHub 협업방식 - 라벨, 이슈, PR 적극 활용

