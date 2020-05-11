# 9. Software Engineering
**:book: Contents**
* [sw공학이란? 필요한 이유? 좋은 설계란?](#sw공학이란?-필요한-이유?-좋은-설계란?)
* [형상관리란?](#형상관리란?)
* [Singleton, Adapter, Template패턴은 어떤 것인가? 왜 사용하는지? 코드 구현해보시오](#Singleton,Adapter,Template패턴은-어떤-것인가?-왜-사용하는지?-코드-구현해보시오)
* [코드 결합도와 응집도란?](#코드-결합도와-응집도란?)
* [블랙박스/화이트박스 테스트란?](#블랙박스/화이트박스-테스트란?)


<<<<<<< HEAD
* [Agile 방법론이 무엇인지 설명해주세요](#Agile-방법론이-무엇인지-설명해주세요)			
* [소프트웨어 생명 주기 모델은 무엇이고 어떤 모델이 있는지 설명해주세요](#소프트웨어-생명-주기-모델은-무엇이고-어떤-모델이-있는지-설명해주세요)
=======
* [Agile 방법론이 무엇인지 설명해주세요]				
* [소프트웨어 생명 주기 모델은 무엇이고 어떤 모델이 있는지 설명해주세요]
>>>>>>> c1aac125c16d30027a0d6360dacf5bf7baf5a190
* [CVS, SVN, GIT에 대해서 아는대로 설명해 보시오]
* [형상 관리를 잘못하면 어떤 문제가 발생하나요?]
* [객체지향과 절차지향 차이 설명해주세요]
---
### sw공학이란? 필요한 이유? 좋은 설계란?

**sw공학이란?**
- sw의 설계, 개발, 유지보수 등에 대한 체계적인 이론과 기술

**필요한 이유?**
- 시간이 지날수록 sw의 수요는 늘었지만 sw의 개발은 여전히 어렵고 힘들어 여러 가지 문제점이 나타나기 시작했다
- 유지보수나 확장등의 문제를 해결하기 위해 sw공학이 필요하다.

**좋은 설계란?**
- 요구사항 명세서의 모든 내용을 포함
- 유지 보수시 변경이 용이

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 형상관리란?
- sw의 변경사항을 체계적으로 추적하고 통제하는 것
- 프로젝트와 관련된 모든 변경사항을 관리한다
- 형상 관리 도구 : CVS, SVN, Git 등이 있다

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


### Singleton,Adapter,Template패턴은 어떤 것인가? 왜 사용하는지? 코드 구현해보시오
**Singleton 패턴**
- 생성자가 여러 차례 호출되더라도 실제 생성되는 객체는 하나이고
최고 생성 이후 호출된 생성자는 최초 생성자가 생성한 객체를 리턴한다
- DBCPC(DataBase Connetcion Pool)과 같은 상황에서 많이 사용된다
**구현**
- 생성자를 외부에서 호출할수 없게 private으로 선언한다
- 인스턴스 생성을 내부에서 처리하여 외부에서는 그것을 가져다가 쓰기만 하도록한다
> [참고](https://gmlwjd9405.github.io/2018/07/06/singleton-pattern.html)

**Adapter 패턴**
![adapter patteren](https://user-images.githubusercontent.com/55946791/81135809-8bb44380-8f94-11ea-9b96-8af9af1cdb66.png)

- 한 클래스의 인터페이스를 사용하고자 하는 다른 인터페이스로 변환한다.
- 어댑터를 이용하면 인터페이스 호환성 문제 때문에 같이 쓸 수 없는 클래스들을 연결해서 쓸수 있다.

> [참고](https://niceman.tistory.com/141)

**Template 패턴**
- public final 메소드(HoustTemplate.buildHouse())에서 알고리즘의 골격을 정의한다.
- 알고리즘의 여러 단계 중 일부는 서브 클래스(WoodenHouse.java, GlassHouse.java)에서 구현할 수 있다.
- 템플릿 메소드를 이용하면 알고리즘의 구조는 그대로 유지하면서 서브클래스에서 특정 단계를 재정의 할 수 있다.

![template method 패턴](https://user-images.githubusercontent.com/55946791/81136309-2b260600-8f96-11ea-892a-41016e775907.JPG)

> [참고](https://niceman.tistory.com/142?category=940951)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


### 코드 결합도와 응집도란?
**결합도**
모듈간의 연결되어 상호 의존하는 정도
결합도가 약할수록 좋은 설계

**응집도**
모듈 안의 요소들이 서로 관련되어 있는 정도
응집도가 강할수록 좋은 설계

> [참고](https://chayan-memorias.tistory.com/90)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


### 블랙박스/화이트박스 테스트란?
**화이트 박스 검사**
- sw 내부 코드를 테스트 하는 기법
- 개발자 관점의 내부 구조와 동작을 테스트 하는 방법

**블랙 박스 검사**
- sw내부 구조나 작동 원리를 모르는 상태에서 동작을 검사하는 방법

> [참고](https://kkhipp.tistory.com/158)
> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### Agile 방법론이 무엇인지 설명해주세요
**애자일 방법론**
일정한 주기를 가지고 끊임없이 프로토 타입을 만들어 내며, 그때그때 필요한 요구를 더하고 수정하여 하나의 커라단 소프트웨어를 만들어 내는 소프트웨어 개발 방법론인 Agile 개발 방법론 채택
<br>
일정 주기를 가지고 계속 프로토 타입을 만들면서 요구사항을 필요할때마다 추가하고 수정하면서 큰 프로그램을 만들어 나아가는 겁니다.
1~2주나 3~4주 단위로 쪼개서 개발합니다.
이런게 많아지자 이를 지원하는 소프트웨어도 생겨났습니다.
Jira같은 것이 있죠. 하지만 장점만 있는 건 아닙니다. 너무 개발자 중심이고, 수정이 가능하다에서 무한 수정이 될 수 있습니다.
시너지가 있을 수도 있지만 그에 대한 부작용도 많을 수 있습니다.
> [참고](http://blog.naver.com/PostView.nhn?blogId=potter777777&logNo=220784755910)

**애자일 방법론의 장점**
- 프로젝트 진행 중간 중간에 필요한 요소들을 바꿀 수 있습니다.
- 시작할 때 프로젝트를 정확하게 규정하지 않아도 됩니다.
- 작은 요소들을 출시 할 때 빠르게 만들 수 있습니다.
- 점진적으로 테스트되기 때문에 초기에 버그를 발견할 수 있습니다.


> [참고](https://flearning-blog.tistory.com/233)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 소프트웨어 생명 주기 모델은 무엇이고 어떤 모델이 있는지 설명해주세요

**생명 주기 모델**
-소프트웨어를 어떻게 개발할 것인가에 대한 추상적 표현
- 프로젝트 비용 산정과 개발 계획 수립의 기본 골격
- 요구사항 분석(정의) -> 개발(설계, 구현, 테스트) -> 유지보수

**모델 종류**
1. 폭포수 모델
	- 선형 순차적, 처음부터 사용자들이 요구사항 명확하게 제시해야한다
	- 요구사항이 이해하기 쉽고, 시스템 개발 중 급격한 변경이 없는 경우 효과적

2. 프로토 타입 모델
	- 포르토타입 모델 제시
<<<<<<< HEAD

=======
>>>>>>> c1aac125c16d30027a0d6360dacf5bf7baf5a190
3. 나선형 모델
	- 폭포수 개선 + 프로토타입 모델의 반복성 + 위험분석
	- 대규모 프로젝트에 적합
	- 여러 차례 개발 과정 반복

> [참고](https://storyofsol.tistory.com/124)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### CVS, SVN, GIT에 대해서 아는대로 설명해 보시오

- CVS (Concurrent Version System)
  - 90년에 출시된 무료 서버-클라이언트 형상관리 시스템.
  - 파일 전체를 저장하는 것이 아니라 __변경사항만을 저장함__ 으로 용량을 적게 차지하지만
  - 속도가 상대적으로 느리다.

- SVN (Subversion)
  - 형상관리/소스관리 툴의 일종.
  - 중앙관리만을 지원.
  - 다른 사용자의 커밋과 엉키지 않으며, 커밋 실패 시 롤백 기능을 지원.
  - 안정성에 있어 CVS보다 상대적으로 좋지 않다.

- Git
  - 분산형 버전관리 시스템
  - Repository의 완전한 복사본을 로컬에 저장할 수 있다.
  - 처리속도가 빠르지만 대용량 코드 관리에 부적절하다.

> [참고](https://velog.io/@rxjw95/SE)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 형상 관리를 잘못하면 어떤 문제가 발생하나요?

대규모 프로젝트는 수십, 수백명의 인원이 소프트웨어를 함께 개발하는데 그에 맞는 표준이 존재하지 않고 서로의 개발 사항을 확인하지 못한다면 프로젝트의 위험이나 혼란이 발생할 수 있음

```
대규모 프로젝트에서는 발생 가능한 위험이나 혼란을 줄이고 프로젝트를 체계적으로 관리하기 위해 형상관리가 반드시 필요
```

> [참고](https://velog.io/@rxjw95/SE)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)			

### 객체지향과 절차지향 차이 설명해주세요
<<<<<<< HEAD

**절차지향 프로그래밍**
- 실행하고자 하는 절차를 정하고, 이 절차대로 프로그래밍하는 방법
목적을 달성하기 위한 일의 흐름에 중점을 둔다.

- 장점 : 객체지향보다 속도가 빠르다

**객체지향 프로그래밍**

- 실세상의 물체를 객체로 표현하고, 이들 사이의 관계, 상호 작용을 프로그램으로 나타낸다.

- __객체를 추출하고 객체들의 관계를 결정__ 하고 이들의 __상호 작용에__ 필요한 함수(메서드)와 변수(필드)를 설계 및 구현하다.

- 객체 지향의 행심은 연관되어 있는 변수와 메서드를 하나의 그룹으로 묶어서 그룹핑하는 것이다.

- 사람의 사고와 가장 비슷하게 프로그래밍을 하기 위해서 생성된 기법

- 하나의 클래스를 바탕으로 서로 다른 상태를 가진 인스턴스를 만들면 서로 다른 행동을 하게 된다. 즉, 하나의 클래스가 여러 개의 인스턴스가 될 수 있다는 점이 객체 지향이 제공하는 가장 기본적인 재활용성이라고 할 수 있다.

- 단점 : 설계에 많은 시간
- 장점 : 유지보수에 좋다. 큰 프로젝트에 적합하다

=======
객체지향 프로그래밍과 절차지향 프로그래밍의 차이
절차지향 프로그래밍
실행하고자 하는 절차를 정하고, 이 절차대로 프로그래밍하는 방법
목적을 달성하기 위한 일의 흐름에 중점을 둔다.
객체지향 프로그래밍
실세상의 물체를 객체로 표현하고, 이들 사이의 관계, 상호 작용을 프로그램으로 나타낸다.
객체를 추출하고 객체들의 관계를 결정하고 이들의 상호 작용에 필요한 함수(메서드)와 변수(필드)를 설계 및 구현하다.
객체 지향의 행심은 연관되어 있는 변수와 메서드를 하나의 그룹으로 묶어서 그룹핑하는 것이다.
사람의 사고와 가장 비슷하게 프로그래밍을 하기 위해서 생성된 기법
하나의 클래스를 바탕으로 서로 다른 상태를 가진 인스턴스를 만들면 서로 다른 행동을 하게 된다. 즉, 하나의 클래스가 여러 개의 인스턴스가 될 수 있다는 점이 객체 지향이 제공하는 가장 기본적인 재활용성이라고 할 수 있다.
>>>>>>> c1aac125c16d30027a0d6360dacf5bf7baf5a190
> [참고1](https://gmlwjd9405.github.io/2017/10/01/basic-concepts-of-development-java.html)
> [참고2](https://gbsb.tistory.com/3)

> :arrow_double_up:[Top](#9-Software-Engineering)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#9-Software-Engineering)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
