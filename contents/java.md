# 7. Java
**:book: Contents**
* [자바 컴파일 과정을 설명하라](#자바-컴파일-과정을-설명하라)
* [String, StringBuffer, StringBuilder의 차이점에 대해 설명하라](#String,StringBuffer,StringBuilder)
* [OOP의 4가지 특징](#OOP의-4가지-특징)
* [오버로딩과 오버라이딩의 차이](#오버로딩과-오버라이딩의-차이)
* [HashMap과 TreeMap의 차이](#HashMap과-TreeMap의-차이)

* GC에 대해 설명하라							
* 자바의 메모리구조는?							
* 동등성(equals)과 동일성(==)에 대해 설명하라							
* 제네릭과 와일드카드에 대해 설명하라							
* 멀티스레딩환경에서 동기화문제를 해결하는 방법에대해 설명하라 (syncronized, atomic, volatile)

---

### 자바 컴파일 과정을 설명하라
![jvm구조](https://user-images.githubusercontent.com/55946791/80935310-02bbd180-8e07-11ea-8723-b1f09125e26c.jpg)

1. .java 파일을 build하면 Java Compiler의 javac라는 명령어를 사용해서 .class파일을 생성한다
(.class파일은 byte code로 아직 컴퓨터가 읽을 수 없는 반기계어 이다.)
3. .class파일은 Class Loader에 의해서 JVM내로 로드 된다.
4. 실행엔진(인터프리터 또는 JIt)을 이용해서 byte code-> binary code로 변환한다.
5. 변환된 binary code(기계어)는 메모리에(Runtime Data Area) 배치된다.
6. Runtime 실행
- 이와 같은 과정을 통해 Java파일이 컴파일되고, JVM에 의해 해당 OS에 맞게 변환시커 컴퓨터가 읽을 수 있도록 만들어준다.

**실행 엔진 종류**
- Interpreter : 자바 byte code를 한줄 씩 실행. 속도 느림
- JIT Compiler : (Just In Time)Interpreter의 단점을 보완.
전체 byte code를 컴파일, 속도가 느리지만 캐시를 사용해서
한번 컴파일 하면 다음에는 빠르게 수행된다.


> <https://kim6394.tistory.com/215>
<https://aljjabaegi.tistory.com/387>

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### String,StringBuffer,StringBuilder
**공통점**
String을 저장하고 관리하는 클래스
**차이점**
immutable(불변) : String
mutable(가변) : StringBuffer, StringBuilder

**String**
- 리터럴을 통해 생성되면, 그 인스턴스의 메모리 공간은 절대 변하지 않는다
```java
String str = "literal" // 리터럴로 생성하는 방식
```
- 문자열 변수에 변화를 주면, 메모리 공간 내의 값이 변하는 것이 아니라
__String Pool이라는 공간안에 메모리를 할당 받아 새로운 String 클래스 객체를__ 만들어서
문자열을 나타낸다.
- 따라서 변화가 나타날때마다
    1. 기존 문자열은 가비지 콜렉터에 의해 제거되야 하고
    2. 계속해서 문자열 객체를 만드는 오버헤드가 발생해서 성능이 떨어진다.

**String 클래스가 적절한 경우**
- String클래스는 문자열 연산이 적고, 자주 조회하는 경우 사용하면 좋다.
- 멀티쓰레드 환경

**StringBuffer vs StringBuilder**
- String과 다르게 문자열 연산시, 클래스는 한번만 만들고(new), 메모리의 값을 변경시켜서 문자열을 변경한다.

**StringBuffer**
- 멀티 쓰레드 환경에서 동기화 O, 즉 thread-safe하다

**StringBuilder**
- 동기화 X
- 싱글 쓰레드 환경에서 StringBuffer에 비해 연산처리가 빠르다.



> <https://jeong-pro.tistory.com/85>

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### OOP의 4가지 특징
캡상추다
1. 캡슐화
특정 객체가 독립적으로 역할을 수행하기 위해 필요한 데이터와 기능을 하나로 묶은것.(모듈화)
객체 안의 정보에 직접 접근을 허용하지 않고 필요에 따라 확인할 수 있는 인터페이스를 외부에 공개한다.(은닉화)

2. 상속
상위 개념의 특징을 하위 개념이 물려받는 것

3. 추상화
객체들의 공통적인 특징(속성, 기능)을 모아 하나의 클래스로 다룬다
각 객체의 구체적인 개념에 의존하지 말고 추상적인 개념에 의존해야 설계를 유연하게 변경할 수 있다.
아우디 ->자동차
벤츠 -> 자동차

4. 다형성
하나의 타입으로 여러가지 참조변수를 사용할수 있는것

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 오버로딩과 오버라이딩의 차이
**Overloading**
- 개념
하나의 클래스에서 같은 이름의 메소드를 여러 개 가질 수 있다.
단, 메서드의 파라메터 값은 달라야 한다. (반환 타입은 같아도,달라도 된다.)
- 오버라이딩은 왜 있는지?
유사한 일을 수행하면서 인자마 다른 메소드들을 각기 다른 이름으로 준다면 불편.
ex) 키보드를 문서용 키보드 , 게임용 키보드를 따로 만들면 비효율적이다.

**Overridng**
- 개념
슈퍼클래스를 상속받은 서브 클래스에서 슈퍼 클래스의 메소드를 같은 이름, 같은 반환값,
같은 인자로 메소드 내의 로직들을 새롭게 정의 하는 것.
오버라이딩을 이용해서 같은 이름이지만 구현하는 클래스마다 다른 역할을 하는 메소드를 정의한다
ex) 키보드라는 모양을 가졌지만, 문서를 작성하고 게임을 한다.

> <https://brunch.co.kr/@kd4/4>

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### HashMap과 TreeMap의 차이
**Map**
- key와 value를 가진 집합으로, 중복허용X

|기능 | HashMap| HashTable|
|--|--|--|
|key, value  null허용여부| O | X|
| 여러 쓰레드 안전 여부 | X| O|

| HashMap| TreeMap|
|--|--|
| 순서 유지 x | key값에 따라 정렬|
| Hashing으로 내부 구현 | Red-Black 트리로 내부 구현|
|key: null 1개 허용, value:허용 | key: null 허용x, value:허용|
| O(1) get,put 같은 기본 연산에 일정한 시간 성능 | O(log n) 시간
| treemap보다 빠르다 | hashmap보다 느리다|
|Map 인터페이스 구현| NavigableMap 인터페이스 구현|

> <https://genie247.tistory.com/11>

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


* GC에 대해 설명하라

* 자바의 메모리구조는?				
* 동등성(equals)과 동일성(==)에 대해 설명하라
* 제네릭과 와일드카드에 대해 설명하라		
* 멀티스레딩환경에서 동기화문제를 해결하는 방법에대해 설명하라 (syncronized, atomic, volatile)
