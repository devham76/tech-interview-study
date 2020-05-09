# 7. Java
**:book: Contents**
* [자바 컴파일 과정을 설명하라](#자바-컴파일-과정을-설명하라)
* [String, StringBuffer, StringBuilder의 차이점에 대해 설명하라](#String,StringBuffer,StringBuilder)
* [OOP의 4가지 특징](#OOP의-4가지-특징)
* [오버로딩과 오버라이딩의 차이](#오버로딩과-오버라이딩의-차이)
* [HashMap과 TreeMap의 차이](#HashMap과-TreeMap의-차이)

* [GC에 대해 설명하라](#GC에-대해-설명하라)
* [자바의 메모리구조](#자바의-메모리구조)
* [동등성(equals)과 동일성(==)](#equals,==)
* [제네릭과 와일드카드](#제네릭과-와일드카드)
* [멀티스레딩환경에서 동기화문제를 해결하는 방법에대해 설명하라 (syncronized, atomic, volatile)](#멀티스레딩환경에서-동기화문제를-해결하는-방법)

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
<https://jeong-pro.tistory.com/148>

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


### GC에 대해 설명하라 ★★★★
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


> - [참고1](https://jeong-pro.tistory.com/148)
> - [참고2](https://hoonmaro.tistory.com/19)

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 자바의 메모리구조
![jvm 메모리 구조](https://user-images.githubusercontent.com/55946791/81367024-0f059e80-9127-11ea-9159-2e7efe749983.png)

**Method area(메소드 or 스테틱 영역)**
- 멤버 변수이름, 데이터 타입, 접근제어자 같은 필드 정보
- 메소드 이름, 리턴 타입, 파라메터, 접근 제어자 같은 __메소드 정보__
- type정보 (interface or class), Constant Pool(상수 풀: 문자 상수, 타입, 필드, 객체참조)
- __static변수, final class변수__ 등이 생성
- JVM 시작시 생성, 프로그램 종료시에 해제

**Heap area**
- __new 키워드로 생성된 객체와 배열을__ 저장
- 메소드 영역에 로드된 클래스만 생성가능하다
- 참조하는 변수나 필드가 없으면 의미 없는 객체가 되어 __GC의 대상이 된다__

**Stack area**
- 지역변수, 파라메터, 리턴 값, 연산에 사용되는 임시 값이 생성되는 영역
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

**Native Method Stack**
- 자바 외 언어로 작성된 네이티브 코드를 위한 메모리 영역
- 보통 c/c++등의 코드를 수행하기 위한 스택

**쓰레드가 생성되었을 때**
- method, heap : 모든 쓰레드가 공유
- stack, pc레지스터, native method stack : 각각의 쓰레드마다 생성, 공유x

> [참고1](https://hoonmaro.tistory.com/19)
> [참고2](https://jeong-pro.tistory.com/148)


### equals,==

- equals() 는 객채간의 __내용(값)을__ 비교할 수 있는 __'메소드'__ 입니다.

- ==는 객체의 __참조(주소)값을__ 비교하는 __'연산자'__ 입니다.

> [참고](https://ojava.tistory.com/15)

> :arrow_double_up:[Top](#7-java)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#7-java)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 제네릭과 와일드카드

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

### 멀티스레딩환경에서 동기화문제를 해결하는 방법
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
