# 9. Software Engineering
**:book: Contents**
* [sw공학이란? 필요한 이유? 좋은 설계란?](#sw공학이란?-필요한-이유?-좋은-설계란?)
* [형상관리란?](#형상관리란?)
* [Singleton, Adapter, Template패턴은 어떤 것인가? 왜 사용하는지? 코드 구현해보시오](#Singleton,Adapter,Template패턴은-어떤-것인가?-왜-사용하는지?-코드-구현해보시오)
* [코드 결합도와 응집도란?](#코드-결합도와-응집도란?)
* [블랙박스/화이트박스 테스트란?](#블랙박스/화이트박스-테스트란?)

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
Singleton,Adapter,Template패턴
**Singleton 패턴**
- 생성자가 여러 차례 호출되더라도 실제 생성되는 객체는 하나이고
최고 생성 이후 호출된 생성자는 최초 생성자가 생성한 객체를 리턴한다
- DBCPC(DataBase Connetcion Pool)과 같은 상황에서 많이 사용된다
**구현**
- 생성자를 외부에서 호출할수 없게 private으로 선언한다
- 인스턴스 생성을 내부에서 처리하여 외부에서는 그것을 가져다가 쓰기만 하도록한다

**Adapter 패턴**


**Template 패턴**

> [참고](https://gmlwjd9405.github.io/2018/07/06/singleton-pattern.html)

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
