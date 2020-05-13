# 7. Java
**:book: Contents**
* [자바 컴파일 과정을 설명하라](#자바-컴파일-과정을-설명하라)
* [String, StringBuffer, StringBuilder의 차이점에 대해 설명하라](#String,StringBuffer,StringBuilder)
* [OOP의 4가지 특징](#OOP의-4가지-특징)
* [오버로딩과 오버라이딩의 차이](#오버로딩과-오버라이딩의-차이)
* [HashMap과 TreeMap의 차이](#HashMap과-TreeMap의-차이)
---
* [GC에 대해 설명하라](#GC에-대해-설명하라)
* [자바의 메모리구조](#자바의-메모리구조)
* [동등성(equals)과 동일성(==)](#equals,==)
* [제네릭과 와일드카드](#제네릭과-와일드카드)
* [멀티스레딩환경에서 동기화문제를 해결하는 방법에대해 설명하라 (syncronized, atomic, volatile)](#멀티스레딩환경에서-동기화문제를-해결하는-방법)

---
* java의 접근 제어자의 종류와 특징 설명해주세요
* 멤버 변수 & 지역 변수
* non-static 멤버와 static멤버의 차이 설명해주세요
* final 키워드 (final/finally/finalize) 설명해주세요
* 인터페이스와 추상 클래스의 차이(Interface vs Abstract Class) 설명해주세요
* set, list, map의 차이와 각각의 인터페이스 구현체의 종류를 설명해주세요

* Comparable, Comparator 차이

---
* [java8을 써보셨나요? java7에서 8로 올라오면서 어떤게 달라졌나요?](#java8을-써보셨나요?-java7에서-8로-올라오면서-어떤게-달라졌나요?)
* [this 키워드](#this-키워드)
* [자바에서 tcp udp 소켓 생성 방법](#자바에서-tcp-udp-소켓-생성-방법)
* [리틀엔디안 빅엔디안](#리틀엔디안-빅엔디안)
* [Reflection](#Reflection)
* [oop 5대 원칙](#oop-5대-원칙)

---
---
## 자바 컴파일 과정을 설명하라
![jvm구조](https://user-images.githubusercontent.com/55946791/80935310-02bbd180-8e07-11ea-8723-b1f09125e26c.jpg)

1. .java 파일을 build하면 Java Compiler의 javac라는 명령어를 사용해서 .class파일을 생성한다
(.class파일은 byte code로 아직 컴퓨터가 읽을 수 없는 반기계어 이다.)
3. .class파일은 Class Loader에 의해서 JVM내로 로드 된다.
4. 실행엔진(인터프리터 또는 JIt)을 이용해서 byte code-> binary code로 변환한다.
5. 변환된 binary code(기계어)는 메모리에(Runtime Data Area) 배치된다.
6. Runtime Data Area에 올라간 파일은 실행엔진(Execution Engine)에 의해 실행
- 이와 같은 과정을 통해 Java파일이 컴파일되고, JVM에 의해 해당 OS에 맞게 변환시커 컴퓨터가 읽을 수 있도록 만들어준다.

**실행 엔진 종류**
- Interpreter : 자바 byte code를 한줄 씩 실행. 속도 느림
- JIT Compiler : (Just In Time)Interpreter의 단점을 보완.
전체 byte code를 컴파일, 속도가 느리지만 캐시를 사용해서
한번 컴파일 하면 다음에는 빠르게 수행된다.


> - <https://kim6394.tistory.com/215>
> - <https://aljjabaegi.tistory.com/387>
> - <https://jeong-pro.tistory.com/148>

**JRE**
 - 자바 클래스 라이브러리(Java class libraries) +
 자바 클래스 로더(Java class loader) +
 자바 가상 머신(Java Virtual Machine)
>[참고](http://www.itworld.co.kr/news/110768)

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## String,StringBuffer,StringBuilder

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
- 내부적으로 append 등 모든 메소드에 대해 synchronized 키워드가 붙어있다.

**StringBuilder**
- 동기화 X
- 싱글 쓰레드 환경에서 StringBuffer에 비해 연산처리가 빠르다.


> <https://jeong-pro.tistory.com/85>

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## OOP의 4가지 특징
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

## 오버로딩과 오버라이딩의 차이
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

## HashMap과 TreeMap의 차이
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


## GC에 대해 설명하라 ★★★★
(조금더 깊게)

- Heap 메모리 영역에 적재된 객체의 생존 여부를 판단하여 더 이상 사용되지 않는(참조 되지 않는) 객체를 해제하는 방식으로 메모리를 자동 관리한다.

- 참조 루트로부터 더이상 참조할수없을때는
참조성을 따져서 강한참조는 해제안되고
약한 참조는 해제될수있다
메모리가 부족하면 해제될수있다. (자바의 참조성)
- 참조성 (강한참조, 약한참조..)
- 두 객체끼리 강한참조이면 해제된다. 참조루트로부터 참조될수없으면 해제된다


- GC가 제거하는 시간은 정확히 언제인지 모른다. (참조가 없어지자마자 해제 되지않는다)
- GC가 수행되는 동안 GC를 수행하는 쓰레드가 아닌 __다른 모든 쓰레드는 일시정지__
- 특히 Full GC가 일어나서 수 초간 모든 쓰레드가 정지한다면 장애로 이어지는 치명적인 문제 발생가능
<br>

**Heap영역은 GC의 주요 대상**
- 구현원리 , 객체들이 한번 참조되면
- 처음에 에덴에 생성이 되고, .....(조사할것)
- __Young Generation__
	- 이 영역은 자바 객체가 생성되자마자 저장되고, 생긴지 얼마 안되는 객체가 저장되는 공간이다. 시간이 지나 우선순위가 낮아지면 Old 영역으로 옮겨진다. 이 영역에서 객체가 사라질 때 Minor GC가 발생한다.
- __Old(Tenured) Generation__
	- Young Generation 영역에서 저장되었던 객체 중에 오래된 객체가 이동되어 저장되는 영역이다. 이 영역에서 객체가 사라질 때 Major GC(Full GC)가 발생한다.


> <https://d2.naver.com/helloworld/1329>
> - [참고1](https://jeong-pro.tistory.com/148)
> - [참고2](https://hoonmaro.tistory.com/19)

<br>
**GC**
- C++에서 new나 delete를 통해 메모리를 명시적으로 해제했지만 Java에서는 개발자가 프로그램 코드로 메모리를 명시적으로 해제하지 않고 가비지 컬렉터(Garbage Collector)가 이 역할을 대신한다. 더 이상 사용하지 않는 객체를 찾아서 지우는 역할을 하는것이 GC 이다.
<br><br>
 Garbage Collection을 실행하면 JVM이 일시적으로 어플리케이션 실행을 멈추는데 이를 stop-the-world 라 한다.
<br><br>
 stop-the-world가 발생하면 GC를 실행하는 쓰레드를 제외한 나머지 쓰레드는 모두 작업을 멈춘다. GC 작업을 완료한 이후에야 중단했던 작업을 다시 시작한다. 어떤 GC 알고리즘을 사용하더라도 stop-the-world는 발생한다. 대개의 경우 GC 튜닝이란 이 stop-the-world 시간을 줄이는 것이다.
<br><br>
 GC는 아래의 두가지 가설을 토대로 만들어졌다.
<br><br>
대부분의 객체는 금방 접근 불가능 상태(unreachable)가 된다.
오래된 객체에서 젊은 객체로의 참조는 아주 적게 존재한다.
이러한 가설을 ‘weak generational hypothesis’라 한다. 이 가설의 장점을 최대한 살리기 위해서 HotSpot VM에서는 크게 2개로 물리적 공간을 나누었다. 둘로 나눈 공간이 Young 영역과 Old 영역이다.
<br><br>
영역별 데이터 흐름은 아래와 같다.

![helloworld-1329-1](https://user-images.githubusercontent.com/55946791/81578490-d6471d00-93e5-11ea-9987-8b56a33d7817.png)

<br><br>
위의 Permanenet Generation 영역은 Method 영역에 포함된 부분이고.. Java 8부터 MetaSpace 영역으로 바뀌었다고 한다. 위 그림과 동일하게 적용되는지는 모르겠다. (PermGen 영역에서 일어나는 GC도 Major GC에 포함된다.)
<br><br>

**Young 영역**
- 새롭게 생성된 데이터 대부분이 Young Generation에 위치하며 여기서 객체가 할당 해제되는 경우 __Minor GC가__ 발생했다고 한다.
  - Eden 영역
  - Survivor 영역(2개)
- 으로 나뉘며, Eden에서 살아남은 객체는 Survivor 으로 보내고, Survivor영역이 가득 차면 다른 Survivor 영역으로 보낸다. 이 과정에서 살아남은 객체는 Old 영역으로 이동하게 된다.


**Old 영역**
접근 불가능 상태로 되지 않아 Young 영역에서 살아남은 객체가 여기로 복사된다. 대부분 Young 영역보다 크게 할당하며, 크기가 큰 만큼 Young 영역보다 GC는 적게 발생한다. 여기서 객체가 할당 해제되는 경우 __Major GC가__ 발생했다고 한다.
<br><br>
Old 영역은 기본적으로 데이터가 가득 차면 GC를 실행한다.
<br><br>
Major GC는 아래와 같은 방식에 따라 동작한다. GC 방식에 따라 처리가 달라진다.
  - Serial GC
  - Parallel GC
  - Parallel Old GC(Parallel Compacting GC)
  - Concurrent Mark & Sweep GC(이하 CMS) Java 9 부터 삭제.
  - G1(Garbage First) GC

>[참고](https://tramyu.github.io/etc/interview/)

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 자바의 메모리구조
![jvm 메모리 구조](https://user-images.githubusercontent.com/55946791/81367024-0f059e80-9127-11ea-9159-2e7efe749983.png)

**Method area(메소드 or 스테틱 영역)**
- __모든 스레드가 공유하는 영역으로 JVM이 시작될 때 생성, 프로그램 종료시 해제.__
- __static변수, final class변수__ 등이 생성
- JVM이 읽어 들인 각각의 클래스와 인터페이스에 대한 런타임 상수 풀, 필드와 메서드 정보, static 변수, 메서드의 바이트코드 등을 보관한다.
- class의 구조 정보가 들어간다.

- 멤버변수(static), 데이터 타입, 접근제어자 같은 필드 정보
- 메소드 이름, 리턴 타입, 파라메터, 접근 제어자 같은 __메소드 정보__
- type정보 (interface or class), Constant Pool(상수 풀: 문자 상수, 타입, 필드, 객체참조)

**Runtime Constant Pool**
- 각 클래스와 인터페이스의 상수뿐만 아니라, 메서드와 필드에 대한 모든 레퍼런스까지 담고 있는 테이블이다.
- 즉, 어떤 메서드나 필드를 참조할 때 JVM은 런타임 상수 풀을 통해 해당 메서드나 필드의 실제 메모리상 주소를 찾아서 참조한다.

**Heap area**
- __new 키워드로 생성된 객체와 배열을__ 저장
- 메소드 영역에 로드된 클래스만 생성가능하다
- 데이터가 동적으로 생성, 소멸
- 참조하는 변수나 필드가 없으면 의미 없는 객체가 되어 __GC의 대상이 된다__

**Stack area**
- 지역변수, 파라메터, 리턴 값, 연산에 사용되는 임시 값이 생성되는 영역
- Method정보, 메소드 호출 시 사용하는 지역변수 데이터 등을 저장한다. {}가 끝나는 동안 유지된다.

- __기본(원시)타입 변수는 스택영역에 직접 값을 가진다__
- ex) int a = 10;  스택영역에 이름이a인 공간 생성, 10입력
- __참조타입 변수는 힙 영역이나 메소드 영역의 객체 주소를 가진다__
- ex) Person p = new Person(); Person p는 스택에 생성, new로 생성된 인스턴스는 heap에 생성
	- 스택에 생성된 p값으로 heap영역에 생성된 객체 참조한다(가르킨다)
- 각 쓰레드 마다 존재, 쓰레드가 시작될때 할당.


**PC 레지스터**
- 쓰레드가 생성될때마다 생성되는 영역
- 현재 쓰레드가 실행되는 부분의 __주소와 명령을 저장__ 하고 있다.
- 이것을 이용해서 쓰레드를 돌아가면서 수행할 수 있다.
- 스레드가 시작 될 때 생성, 현재 수행중인 JVM의 명령의 주소를 가진다.

**Native Method Stack**
- 자바 외 언어로 작성된 네이티브 코드를 위한 메모리 영역
- 보통 c/c++등의 코드를 수행하기 위한 스택

**쓰레드가 생성되었을 때**
- method, heap : 모든 쓰레드가 공유
- stack, pc레지스터, native method stack : 각각의 쓰레드마다 생성, 공유x

> [참고1](https://hoonmaro.tistory.com/19)
> [참고2](https://jeong-pro.tistory.com/148)


## equals,==

- equals() 는 객채간의 __내용(값)을__ 비교할 수 있는 __'메소드'__ 입니다.

- ==는 객체의 __참조(주소)값을__ 비교하는 __'연산자'__ 입니다.

> [참고](https://ojava.tistory.com/15)

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 제네릭과 와일드카드

**Generics(제네릭스)**
- __다양한 타입의 객체들을 다루는 메서드나 컬렉션 클래스에 컴파일시에 타입체크를 해주는 기능__
- 컴파일 후에 지네릭 타입이 제거 되고 원시 타입으로 지정된다. (.class파일에는 지네릭 타입에 대한 정보가 없다.)

**Generics 장점**
    - 타입의 안정성 제공 (의도하지 않은 타입의 객체가 저장되는 것을 막고, 저장된 객체를 꺼내올 때 원래의 타입과 다른 타입으로 잘못 형변환되어 발생하는 오류를 막는다.)
    - 타입체크와 형변환을 생략하여 코드가 간결해진다.
    - ex) ArrayList는 다양한 종류의 객체를 담는다. 보통 한 종류의 객체를 담는다. 꺼낼 때마다 타입체크를 하고 형변화 하는 것은 불편하다.

**Generics 주의할 점**
  - __static멤버에 타입변수 T를 사용x__
    - why? static멤버는 타입 변수에 지정된 타입, 즉 대입된 타입의 종류에 관계없이 동일한 것이어야 하기 때문이다.
    - Box<Apple>.item과 Box<Orange>.item이 다른것이면 안된다는 뜻.
  - 참조변수와 생성자에 대입된 타입이 일치해야한다
  - ex)

  ```java
  Box<Apple> appleBox = new Box<Apple>(); // o
  Box<Apple> appleBox = new Box<Orange>(); // x
  Box<Fruit> appleBox = new Box<Apple>(); // x
  Box<Apple> appleBox = new FruitBox<Apple>() // o (다형성)
  ```

**제한된 Generics**
  - 지네릭 타입에 __extends__ 를사용하면, __특정 타입의 자손들만__ 대입할 수 있다.
  - ex.

  ```java
  // Fruit의 자손만 타입으로 지정가능
  class FruitBox<T extends Fruit>{
    ArrayList<T> list = new ArrayList<T>();
  }
  FruitBox<Apple> appleBox = new FruitBox<Apple>(); // o
  FruitBox<Toy> toyBox = new FruitBox<Toy>(); // x

  FruitBox<Fruit> fruitBox = new FruitBox<Fruit>();
  fruitBox.add(new Apple()); // o, apple은 Fruit의 자손
  fruitBox.add(new Orange());// o, orange는 Fruit의 자손
  ```

  - 만일 클래스가 아니라 인터페이스를 구현해야 한다는 제약이 필요하면 __extends__ 를 사용한다. (implemetns아니다!)
  - ex.

  ```java
  interface Eatable {}
  class FruitBox<T extends Eatable & Fruit> {...}
  ```


**와일드 카드**
- 특정 타입을 지정할때 제한을 둘 수 있다.

```
<? extends T> : 와일드 카드의 상한 제한, T와 그 자손들만 가능
<? super T> : 와일드 카드의 하한 제한, T와 그 조상들만 가능
<?> : 제한 없음. 모든 타입가능 <? extends Objects>와 동일
```

> [참고 - Java의 정석]

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 멀티스레딩환경에서 동기화문제를 해결하는 방법
- synchronized, atomic, volatile

**멀티스레딩**
- 멀티 스레드(multi thread)란? _하나의 프로세스 내에서 둘 이상의 스레드가 동시에 작업을 수행_ 하는 것
- 멀티스레드 프로그램은 __공유하는 자원__ 에 대해 동기화 문제가 발생할 수 있다.
- method area, heap area는 스레드가 공유하는 영역이다.

**멀티스레드 사용이유**
- 멀티 스레드는 각 스레드가 자신이 속한 프로세스의 메모리를 공유하므로, 시스템 __자원의 낭비가 적습니다.__
- 하나의 스레드가 작업을 할 때 다른 스레드가 별도의 작업을 할 수 있어 __사용자와의 응답성도 좋아집니다.__

**Synchronized**
- 자바에서 지원하는 Synchronized키워드는 __현재 데이터를 사용하고 있는 쓰레드를 제외하고 나머지 쓰레드는 데이터에 접근할 수 없도록 막는 개념__
- Synchroinzed 키워드를 너무 __남발하면 오히려 프로그램 성능저하 발생__
	- Synchroinzed 키워드를 사용하면 자바 내부적으로 메서드나 변수에 동기화를 위해 block, unblock처리하는데
	- 이런 처리가 너무 많아지면 성능저하 발생

**Synchronized 방법**
1. 메소드 전체를 임계 영역으로 지정
	- 함수에 lock을 거는 것처럼 보이지만, 실제로는 객체에 lock을 건다.
  - 즉, synchronized 함수는 자신이 포함된 객체에 lock을 건다. 이 방법은 간단하지만 객체에 포함된 다른 것들도 lock이 걸리기 때문에 무식한 방법이기도 하다.
  - _메서드 전체에 걸기보다 synchronized블러으로 임계 영역을 최소화 하는것이 좋다_

- static 함수에 걸면 class전체에 lock이 걸린다
```java
public synchronized void fun(String param) {
  // 동기화 하고싶은 코드
}
```

2. 특정 영역을 임계 영역으로 지정
	- 필요한 부분에만 동기화처리를 하고, 동기화가 필요없는 부분은 lock을 걸지않고 그대로 둘 수 있다.
	- 이때 obj(객체 참조변수)는 lock의 주체이기 때문에 obj가 락을 풀때까지 다른 블록들은 대기

```java
private Object obj = new Object();
public void exampleMethod(){
	synchronized(obj){
		// 동기화 하고싶은 코드
	}
}
```

**Atomic**
- lock이나 synchronized없이도 결과의 안정성을 보장받을 수 있는 것을 __원자적(Atomic)__ 이라고 하고,
- 자바의 concurrent 패키지에서 이를 제공한다.
<br>

- AtomicInter 클래스는 __CAS(compare-and-swap)__ 기반으로 되어있다.
- CAS는 특정 메모리 위치와 주어진 위치의 value를 비교하여 다르면 대체하지 않는다.
- 이 방법은 저수준의 H/W에서 제공한다.

```java
private AtomicInteger c = new AtomicInteger();

public int getNextIndex(){
	return c.getAndIncrement();
}
```

**Volatile**
<br>
- atomic안에 volatile이 구현되어있다
_[자바의 정석 설명]_
- 멀테 코어 프로세서가 장착된 컴퓨터에서, 코어마다 별도의 캐시를 가질때 문제가 발생할수있다.
- 코어는 메모리에서 읽어온 값을 캐시에 저장하고 캐시에서 값을 읽어 작업한다.
- 다시 같은 값을 읽어올 때는 먼저 캐시에 있는지 확인하고 없을 때만 메모리에서 읽어온다.
- 그러다 보니 도중에 메모리에 저장된 변수의 값이 변경 되었는데도 , 캐시에 저장된 값이 갱신되지 않아 메모리에 저장된 값이 다른 경우가 발생한다.
<br>
- 따라서 변수 앞에 volatile을 붙이면, 코어가 변수의 값을 읽어올때 캐시가 아닌 메모리에서 읽어오기 때문에 캐시와 메모리간의 값의 불일치가 해결된다.
<br><br>

_[인터넷 블로그 설명]_
- 자바 변수에 volatile을 붙이면 volatile 변수를 읽어 들일 때 __cpu캐시가 아니라 컴퓨터의 메인 메모리에서 읽는다___
- volatile 키워드는 __가시성__ 문제를 해결해준다.
- 가시성 문제란? 멀테 쓰레드 환경에서 메인 메모리로 아직 기록하지 않은 값을 보지 못하여 동기화가 깨진 상황을 말한다
- volatile을 써야 하는 경우는 한 쓰레드에서 변수의 값을 읽고 쓰며, 다른 쓰레드에서 읽기만 하는 경우 항상 value를 보장해줄수있다
- 그러지 않고 멀티 쓰레드가 value를 변경한다면 synchronization을 적용해야 한다

```java
public class Foo {
	public volatile int c = 0;
}
```

>[참고](https://doll6777.github.io/android/2019/07/10/synchronized/)

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


## java의 접근 제어자의 종류와 특징 설명해주세요
![접근 제어자](https://user-images.githubusercontent.com/55946791/81496271-7cfdc180-92f1-11ea-8c19-2e2f66c70b99.png)

|접근제어자|설명|
|--|--|
|public| 프로젝트 안에서 자유롭게 사용가능하다 (제한이 전혀없다)|
|protected| 같은 패키지 내에서 and 다른 패지키의 자손 클래스에서 접근 가능|
|default| 같은 패키지 내에서만 접근 가능|
|private| 같은 클래스 내에서만 접근 가능|

![접근제어자2](https://user-images.githubusercontent.com/55946791/81496334-de259500-92f1-11ea-9803-6f65defddaf0.png)

**Q. 접근 제어자의 조합 퀴즈**
1. 메소드에 static 과 abstract 를 함께 사용 할 수 없다.  why ? static 메소드에는 몸통이 있는 메소드에서만 사용 할 수 있기 때문
2. 클래스에 abstract 와 final 을 동시에 사용 할 수 없다.  why ? 클래스에 사용되는 final은 클래스를 확장 할 수 없다는 의미이고, abstract 는 상속 을 통해서 완성되어야 한다는 의미이므로 서로 모순되기 때문이다.
3. abstract 메소드의 접근 제어자가 private 일 수는 없다.  why ? abstract 메소드는 자손클래스에서 구현하기 위해 접근해야 하기 때문이다.
4. 메소드에 private 과 final 을 같이 사용 할 필요는 없다.  why ? 접근제어자가 private 인 메소드는 오버라이딩 될 수 없기 때문이다. 이 둘중 하나만 사용해도 의미가 충분하다.


> [참고](https://csw7432.tistory.com/entry/Java-%EC%A0%91%EA%B7%BC%EC%A0%9C%EC%96%B4%EC%9E%90-Access-Modifier)


## 멤버 변수 & 지역 변수

**멤버 변수**
- 클래스 블록 영역에 선언되는 변수

**멤버 변수 - static O**
- 클래스 변수, 공통변수, 정적변수, 전역변수
- 컴파일시에 메모리할당,  프로그램 종료시 메모리 해제
- 클래스 전체에서 사용 가능
- 클래스의 모든 인스턴스가 같은 저장공간을 가리킨다
- 저장공간 : Method 영역

**멤버 변수 - static X**
- 인스턴스 변수
- 객체 생성시마다 따로 저장되는 변수
- 저장공간 : Heap 영역
- GC가 관리한다

**지역 변수**
- 메소드 블록 영역
- 저장공간 : Stack 영역



>[참고](https://m.blog.naver.com/PostView.nhn?blogId=turtle0720&logNo=60209489019&proxyReferer=https:%2F%2Fwww.google.com%2F)


## non-static 멤버와 static멤버의 차이 설명해주세요
- static은 메서드 or 변수에 붙을수있다.

- static 사용의 이점

**static 멤버**
- 공간적 특성 : __멤버는 클래스당 하나 생성__
	- 객체 내부에 생성되는것 이아니고 컴파일시 method영역에 고정적으로 메모리 할당
	- 클래스 멤버
- 시간적 특성: __클래스 로딩 시에 멤버 생성__
	- 컴파일시 생성, 프로그램 종료시 메모리 해제
	- 객체 생성 하지 않고도 사용가능
	- 객체가 사라져도 멤버는 사라지지않음
- 공유의 특성 : __동일한 클래스의 모든 객체들에 의해 공유된다__

**non-static 멤버**
- 공간적 특성 : __멤버는 객체마다 별도로 존재__
	- __인스턴스 멤버__ 라고 부른다
	- heap 영역 (클래스 내부에서 선언시) or statck 영역(메소드 내에서 생성시) 에 생성
- 시간적 특성 : __객체 생성시 멤버 생성__
	- 객체 생서 후에 사용 가능
	- 객체가 사라지면 메모리에서 해제
- 공유의 특성 : __공유x__
	- 멤버는 객체 내에서 각각의 공간을 유지

> [참고](https://gmlwjd9405.github.io/2018/08/04/java-static.html)

## final 키워드 (final/finally/finalize) 설명해주세요

**final 키워드**
- 변수나 메서드 또는 클래스가 __‘변경 불가능’__ 하도록 만든다.

	- 원시(Primitive) 변수에 적용 시
		- 해당 변수의 값 변경X
		- final int number = 1;
	- 참조(Reference) 변수에 적용 시
		- 참조 변수가 힙(heap) 내의 다른 객체를 가리키도록 변경X
	- 메서드에 적용 시
		- 해당 메서드를 오버라이딩 X
	- 클래스에 적용 시
		- 해당 클래스를 __상속받을 수 X__

**finally 키워드**
- try/catch 블록이 종료될 때 항상 실행될 코드 블록을 정의하기 위해 사용
	- finally는 선택적으로 try 혹은 catch 블록 뒤에 정의할 때 사용
	- finally 블록은 예외가 발생하더라도 항상 실행
		- 단, JVM이 try 블록 실행 중에 종료되는 경우는 제외
	- finally 블록은 종종 뒷마무리 코드를 작성하는 데 사용
 finally 블록은 try와 catch 블록 다음과, 통제권이 이전으로 다시 돌아가기 전 사이에 실행된다.

**finalize() 메서드**

__쓰레기 수집기(GC, Garbage Collector)가__ 더 이상의 참조가 존재하지 않는 __객체를 메모리에서 삭제하겠다고 결정하는 순간 호출__ 된다.

쓰레기 수집기(GC, Garbage Collector)가 더 이상의 참조가 존재하지 않는 객체를 메모리에서 삭제하겠다고 결정하는 순간 호출된다.


Object 클래스의 finalize() 메서드를 오버라이드해서 맞춤별 GC를 정의할 수 있다.
```java
protected void finalize() throws Throwable {
/* 파일 닫기, 자원 반환 등등 */
}
```


- 개발자가 마음대로 오버라이딩 하면 안좋다.

<br>
- Q) final과 abstract는 동시에 사용가능하나요 ? -> 아니요. 불가능합니다.

<br>
- Q) final 과 abstract는 동시에 사용가능하나요 ? -> 아니요.불가능합니다.


>[참고](https://gmlwjd9405.github.io/2018/08/06/java-final.html)

## 인터페이스와 추상 클래스의 차이(Interface vs Abstract Class) 설명해주세요

**추상 메서드**
- abstract 키워드 함께 원형만 선언되고, 코드는 작성되지 않는 메서드

```java
	public abstract String getName(); // 추상메서드
	public abstract int getAge() {return 11; }; // 추상 메서드 x
```

**추상 클래스**
- 개념 : abstract 키워드로 선언된 클래스
	1. __추상 메서드를 최소 한 개 이상__ 가지고 abstract로 선언된 클래스
		- 최소 한 개의 추상 메서드를 포함하는 경우 __반드시 추상 클래스로 선언__
	2. 추상 __메서드가 없어도 abstract로__ 선언된 클래스
		- 그러나 추상 메서드가 하나도 없는 경우라도 추상 클래스 선언 가능
- 추상 클래스 구현
	- 추상 클래스를 __일반 클래스에서 상속__ 받는다면 슈퍼 클래스의 __모든 추상 메서드를 구현해야한다.__
	- 추상 클래스를 추상 클래스에서 상속 시 , 모든 추상 메서드 구현 안해도 된다.
- 추상 클래스 목적
	- 객체를 생성하기 위함X, 상속을 위한 부모 클래스로 활용하기 위한 것
	- 여러 클래스들의 __공통된 부분을 추상화(추상 메서드)__ 하여 상속받는 클래스에게 구현을 강제화하기 위함 (메서드의 동작을 구현하는 자식 클래스로 책임을 위임)
	- 즉, 추상 클래스의 추상 메서드를 자식 클래스가 구체화하여 __기능을 확장 하는데 목적__ 이 있다.


**인터페이스**
- 개념 : 추상 메서드와(public abstract) + 상수만을 포함 (public static final), interface 키워드 사용하여 선언
- 인터페이스 구현
	- 일반클래스 : 인터페이스를 상속하고, __추상 메서드 모두 구현__
	- 추상클래스: 일부만 구현하면 abstract사용하여 추상클래스로 구현
	- 인터페이스 : 인터페이스를 상속받아 새로운 인터페이스 구현
	- implements 키워드 사용 하여 구현
- 인터페이스의 목적
	- __목적 : 구현 객체의 같은 동작을 보장__
	- 즉, 서로 관련없는 클래스에게 공통적으로 사용하는 방식이 필요핮만 기능을 각각 구현할 필요가 있는 경우 사용


|추상 클래스|인터페이스|
|abstract| interface|
|extends| implements|
|목적:상속을 받아서 __기능을 확장__ 시킨다 | 목적:구현 객체의 __같은 동작을 보장__ 하기 위한 목적|
|다중상속 x | 다중 구현 가능|
|클래스o| 클래스 x|
|abstract class Class| interface Interface|
|일반 변수 가질수있다| 일반변수 x , static이 붙은 변수만 있다|
| is a kind of | cand do this|
|Appliances(Abstract Class) - TV, Refrigerator | Flyable(Interface) - Plane, Bird|

> [참고1](https://gmlwjd9405.github.io/2017/10/01/basic-concepts-of-development-java.html)
> [참고2](https://loustler.io/languages/oop_interface_and_abstract_class/)


## set, list, map의 차이와 각각의 인터페이스 구현체의 종류를 설명해주세요
![java-collections-framework](https://user-images.githubusercontent.com/55946791/81514002-7ca00d80-9367-11ea-8a58-df497bab5432.png)

**Map**
- 검색할 수 있는 인터페이스
- 데이터를 삽입할 때 Key와 Value의 형태로 삽입되며, Key를 이용해서 Value를 얻을 수 있다.
- Map: HashMap, LinkedHashMap, HashTable, TreeMap

**Collection**
- List
	- 순서가 있는 Collection
	- 데이터를 중복O
	- Map: HashMap, LinkedHashMap, HashTable, TreeMap
- Set
	- 집합적인 개념의 Collection
	- 순서의 의미가 없다.
	- 데이터를 중복X
	- Map: HashMap, LinkedHashMap, HashTable, TreeMap


>[참고](https://gmlwjd9405.github.io/2017/10/01/basic-concepts-of-development-java.html)


## 오버플로우
- 오버플로우
데이터마다 크기가 있는데 최대값이 넘어가면 발생, 음수로 넘어간다
- 언더 플로우
최소값에서 더 작아지면 반대로 최대값으로 넘어간다

- 아웃오브메모리
- 힙 오버플로우
- 스택 오버플로우
 	- 스택에서 스택경계를 넘어설때
  - 하나 이상의 메소드가 순환 형식으로 상호 호출하면서 스택 내에 함수 호출 수가 끊임없이 증가할 때 발생한다.

## Comparable, Comparator 차이


## java8을 써보셨나요? java7에서 8로 올라오면서 어떤게 달라졌나요?
- 네 사용해봤습니다. spring프로젝트 때 사용했습니다.


**JAVA 7 부터 지원되는것들**
1. Diamond Operator
- 제네릭스에서 타입 추론가능

```java
  // Before Java 7
  ArrayList<Integer> arr = new ArrayList<Integer>();

  // In Java 7
  ArrayList<Integer> arr = new ArrayList<>();
```

2. swith문에 string자료형 사용 가능
3. 사용한 리소스를 .close()를 이용해서 수동으로 관리하던것을, try문에 선언하면 자동으로 관리가능

```java
// before java 7

try{
	fos = new FileOutputStream("movies.txt");
} catch(IOException e){
	e.printStackTrace();
}finally{
	try{
		fos.colse();
	} catch(IOException e){
	}
}

// java 7

try{
	fos = new FileOutputStream("movies.txt");
} catch(IOException e){
	e.printStackTrace();
}

```

**JAVA 8 부터 지원되는것들**

1. Lambda Expressions

```java
Arrays.asList("a", "b", "c").forEach( e->{
	System.out.println(e);
});
```

2. Stream API
- 배열이나 컬렉션 사용시 반복문이나 iterator를 사용했었다
- 이렇게 되면 코드가 길어져서 가독성 저하, 이를 해결

```java
String[] arr = new String[]{"넷", "둘", "셋", "하나"};


// 배열에서 스트림 생성
Stream<String> stream1 = Arrays.stream(arr);
stream1.forEach(e -> System.out.print(e + " "));
```

3. interface에  default method 생성 가능

4. new Date and Time API
- 이전에는 1월~12월을 0~11로 표현하는등 불편함이 있었다

> :arrow_double_up:[Top](#7-Java)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-Java)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## this 키워드

- this는 자기 자신을 의미하는 키워드
- this.은 class내의 변수와 메소드의 매개변수가 동일할 때, class내의 멤버임을 명확하게 해준다
- this()는 자신의 생성자를 호출할때 사용, 호출하는 곳의 첫번째 문장에 작성해야한다

```java
public class InstanceMemberEx03 {
	String year;
	String month;
	String day;

	public InstanceMemberEx03(String year) {
		this(year, null, null);
	}

	public InstanceMemberEx03(String year, String month) {
		this(year, month, null);
	}

	public InstanceMemberEx03(String year, String month, String day) {
		this.year = year;
		this.month = month;
		this.day = day;
	}
}
```


> :arrow_double_up:[Top](#7-Java)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-Java)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 자바에서 tcp udp 소켓 생성 방법


> :arrow_double_up:[Top](#7-Java)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-Java)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 리틀엔디안 빅엔디안

- Little Endian
	- 메모리의 첫 주소에 하위 데이터(데이터의 맨 오른쪽)부터 저장
- Big Endian
	- 메모리의 첫 주소에 상위 데이터(데이터의 맨 왼쪽)부터 저장

>[참고](https://duzi077.tistory.com/201)
> :arrow_double_up:[Top](#7-Java)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-Java)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


## Reflection
- Reflection : 반사, 투영하다
- 정의 : 객체를 통해 클래스의 정보를 분석해 내는 프로그램 기법

> :arrow_double_up:[Top](#7-Java)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-Java)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## oop 5대 원칙

- SOILD 원칙
	- SRP(단일 책임 원칙) - 응집도는 높게, 결합도는 낮은 프로그램
	- OCP(개방-폐쇄 원칙)
	- LSP(리스코프 치환 원칙)
	- DIP(의존 역전 원칙)
	- ISP(인터페이스 분리 원칙)
- 유지 보수와 확장을 위한 원칙

1. SRP(단일 책임 원칙) - 응집도는 높게, 결합도는 낮은 프로그램
2 .OCP(개방-폐쇄 원칙, Open-Closed)
- 기존의 코드를 변경하지 않고(closed) 기능을 수정하거나 추가할수있도록(open) 설계
- 설계할때 변경되는 것이 무엇인지에 초점을 맞춘다.
- 이를 위해 interface가 자주 사용된다

3. LSP(리스코프 치환 원칙)
- 자식 클래스는 부모클래스에서 가능한 행위를 수행할수있어야한다.
- 틀린 ex)
	- class 도형 { 둘레(){}; 각(){};}
	- class 사각형 extends 도형 { 둘레(); 각(){}; } (o)
	- class 원 extends 도형 { 둘레(); 각(){}; } (x)

4. DIP(의존 역전 원칙)
- 의존 관계를 맺을때, 변하기 쉬운것보다 변하기 어려운것에 의존해야 한다.

5. ISP(인터페이스 분리 원칙)
- 클래스에서 자신이 사용하지 않는 인터페이스는 구현하지 않아야 한다
- 따라서 하나의 인스턴스보다는 여러개의 구체적인 인터페이스를 설계하는 것이 좋다


> [참고](https://dev-momo.tistory.com/entry/SOLID-%EC%9B%90%EC%B9%99)

> :arrow_double_up:[Top](#7-Java)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-Java)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
