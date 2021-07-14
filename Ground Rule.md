## 우리 팀만의 규칙

- 수요일 16:00 ~ 19:00 , 토요일 10:00 ~ 14:00 연락 안됨 - Kane
- 4/30 하루종일, 5/5 저녁시간 - 강경
- TIL 빠지지 않고 잘 쓰기
- 모르는 것 있으면 서로 꼭 의논해서 넘어가지 않기

## 스크럼

- 매일 09:00 ~ 09:15 진행
- 금일 계획세우기
- 프로젝트 진행 사항 브리핑하기
  - Trouble Shooting
  - 공부하고 싶은 개념 제안

## 프로젝트

- 설계 (UML)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d50caae5-b9a3-44f9-b004-e7b12c33ec39/116193831-e9740980-a76a-11eb-949c-25605899fed0.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d50caae5-b9a3-44f9-b004-e7b12c33ec39/116193831-e9740980-a76a-11eb-949c-25605899fed0.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/278973ac-4a90-407a-8e47-4b5ce1115584/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3831353831323530343531363033343631302f3833363438383035353638353930363438322f323032312d30342d32375f332e32342e33332e706e67.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/278973ac-4a90-407a-8e47-4b5ce1115584/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3831353831323530343531363033343631302f3833363438383035353638353930363438322f323032312d30342d32375f332e32342e33332e706e67.png)

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8e3efa18-c069-4cef-8c58-8cde124525af/116566204-85f00480-a941-11eb-9a5c-ebef45a82494.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8e3efa18-c069-4cef-8c58-8cde124525af/116566204-85f00480-a941-11eb-9a5c-ebef45a82494.png)

- 빌드가 되는 상태에서 Commit 남기기 (🚫 에러)

- Commit 양식

  ```swift
  # <타입>: <제목>
  ex)
  Feat: Accessbility 적용
  ##### 제목은 최대 50 글자까지만 입력 ############## -> |
  
  # 본문
  ex)
  - Main View
    - Label, Button에 적용
    - Dynamic Type: Automatically Adjusts Font
  - Catalog View
    - Font: Title1, Body
  ######## 본문은 한 줄에 최대 72 글자까지만 입력 ########################### -> |
  
  # 꼬릿말
  ex)
  - Issue
  	1. cell클릭 후, 화면이 두 개가 나옴
  	2. catalog json파일 디코딩 오류
  # --- COMMIT END ---
  # <타입> 리스트
  #   feat    : 기능 (새로운 기능)
  #   fix     : 버그 (버그 수정)
  #   refactor: 리팩토링
  #   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
  #   docs    : 문서 (문서 추가, 수정, 삭제)
  #   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
  #   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
  # ------------------
  #     제목 첫 글자를 대문자로
  #     제목은 명령문으로
  #     제목 끝에 마침표(.) 금지
  #     제목과 본문을 한 줄 띄워 분리하기
  #     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
  #     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
  # ------------------
  ```

- Branch 양식

  - "StepN - Name - featured"
  - ex) Step1-Kane-TableViewSetting
  - ex) Step1-Kane
  - ex) Step1
  - "StepN" 에서 PR 날리기

## Project TimeLine

### 1주차

- 월: 프로세스 / 프로세서(활동학습) / Step1 구조 설계 및 구현
- 화: STEP 1 완성 후 PR / 알쓸신잡 참여
- 수: STEP 1 PR Review → 수정해야될 부분 정리 / Test에 대한 학습
- 목: Test File 작성 및 Step1 2차 PR
- 금: 비동기 프로그래밍에 대한 앨런 강의 정리 및 학습

### 2주차

- 월: Step1 2차 PR에 대한 피드백 수용 및 ARC 학습 및 정리 & Step2 진행
- 화: Step2 PR 및 시스템 메모리 정리
- 수: Step2 피드백 수용 및 수정
- 목: App LifeCycle 활동학습, Step2 리뷰어 `하이디` 에게 직접 질문 & 답변 수용
- 금: Step3 진행 및 테스트 작성 / Step3 PR 작성
