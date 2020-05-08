# 3. Operating System
**:book: Contents**

- [OS란 무엇이며, 핵심 기능은?](#OS개념과-핵심-기능)
- [부팅이 되는 과정을 설명하시오.](#부팅이-되는-과정)
- [프로세스의 5가지 상태에 대해 설명하시오.](#프로세스의-5가지-상태)
- [메모리 계층 구조를 설명하시오.](#메모리-계층-구조)
- [캐시와 버퍼의 차이점은?](#캐시와-버퍼의-차이점)

* [세마포어와 뮤텍스란? 차이점은 무엇인가?](#세마포어와 뮤텍스란?-차이점은-무엇인가?)			
* [메모리 단편화, 페이징, 세그멘테이션](#메모리-단편화,-페이징,-세그멘테이션)			
* [선점스케줄링과 비선점스케줄링, 해당하는 알고리즘 한개씩](#선점스케줄링과-비선점스케줄링,-해당하는-알고리즘-한개씩)				
* [문맥교환이란?](#문맥교환이란?)			
* [PCB란?](#PCB란?)
---

### OS개념과 핵심 기능
**운영체제란**
H/W와 S/W 사이에서 둘을 효율적으로 운영하고 관리하여
사용자가 컴퓨터를 편리하게 사용할수 있도록 하는 프로그램

**운영체제 기능**
1. 자원관리
- 컴퓨터 시스템을 구성하는 cpu, 기억장치, 주변장치, data등 컴퓨터 자원을 관리한다

2. 프로세스 관리
- 프로세스와 쓰레드 스케줄링, 프로세스 생성과 제거, 프로세스 시작, 정지, 재수행
- 프로세스 동기화 및 통신, 주기억 장치 관리를 위해 주기억장치 관리자와 협력

3. 기억장치 관리
- 메모리 상태 추적, 메모리 할당 및 회수, 가상기억장치 및 페이징 장치 관리, 장치 관리자 또는 파일 관리자와 협력

4. 입출력 장치 관리
- 입출력 장시의 스케줄 관리, 각종 주변장치의 스케줄링 및 관리

5. 파일 관리
- 파일 생성과 삭제, 변경 유지들의 관리
- 정보의 위치, 사용여부와 상태 등을 추적 관리

> <https://flearning-blog.tistory.com/16>

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 부팅이 되는 과정
> <https://neos518.tistory.com/113>

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 프로세스의 5가지 상태
![프로세스 상태](https://user-images.githubusercontent.com/55946791/80938240-559b8600-8e13-11ea-9176-a121491a0fb3.jpg)
1. 생성 : 프로세스 생성 상태 , pcb를 할당받은 상태
2. 실행 : 프로세스가 cpu에 할당되어 실행 중인 상태
3. 준비 : 프로세스가 cpu에 할당되기를 기다리는 상태
4. 대기 : 보류(block)라고도 하며, 프로세스가 입출력이나 이벤트릴 기다리는 상태
5. 종료 : 프로세스 종료 상태

> <https://rebas.kr/852>

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 메모리 계층 구조
![메모리 계층](https://user-images.githubusercontent.com/55946791/80938438-128de280-8e14-11ea-8207-95cb98d94303.jpg)

**메모리 종류**
1. Main 메모리 : 램 (RAM)
2. Register : cpu안에 내장되어 있어 연산을 위한 저장소 제공
3. Cache : cpu와 RAM사이에서 중간 저장소 역할
4. Hard Disk와 이외 장치 : 하드디스크, I/O장치 등
(* CPU와 거리가 가까울수록, 빠르고 용량이 작다. 멀수록, 느리고 용량이 크다)

**데이터 이동**
- 프로그램의 실행을 위해 하드디스크에 있는 내용은 메인 메모리로 이동한다
- 메인 메모리에 있는 일부 데이터도 실행을 위해 L2캐시로 이동한다
- L2캐시에 있는 데이터 일부는 L1캐시로 이동한다
- L1캐시에 있는 데이터 중 연산이 필요한 데이터는 레지스터로 이동한다.

> <https://dakuo.tistory.com/126>

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 캐시와 버퍼의 차이점

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)




### 세마포어와 뮤텍스란? 차이점은 무엇인가?

**세마포어와 뮤텍스 정의**
- 여러 프로세스나 쓰레드가 __공유 자원에 접근하는 것을 제어하기__ 위한 방법
- __병행 처리를 위한 프로세스 동기화 기법__

**세마포어**
- 세마포어 변수, wait()함수, signal()함수가 있다.
- 세마포어 변수 : 공유 가능한 자원의 수
- wait() : 세마포어 값을 감소 시킨다. 음수가되면 호출한 프로세스는 블록된다.
- signal() : 실행되던 프로세스가 종료되어, 세마포어 값을 증가시킨다. 만약 값이 0이거나 음수면, swmWait연산에 의해 블록된 프로세스를 wake_up한다
<br>
- 세마포어 종류 : binary 세마포어(세마포어가 0또는1만허용), counting 세마포어(0또는1이상의수를 가질수있다)

**뮤텍스**
- 초기값을 1과0으로 가진다
- 임계구역에 들어갈때 락(lock)을 걸어 다른 프로세스(or 쓰레드)가 접근하지 못하도록하고
- 임계구역에서 나올때 해당 락을 해제(unlock)한다.

**뮤텍스와 세마포어의 차이**
- 세마포어는 공유 자원에 __세마포어의 변수만큼 프로세스(or 쓰레드)가__ 접근할 수 있다
- 반면에 뮤텍스는 __오직 1개만의 프로세스(or 쓰레드)만 접근 가능
<br>
- 현재 수행중인 프로세스가 아닌 __다른 프로세스가 세마포어 해제__ 가능
- 뮤텍스는 __락(lock)을 획득한 프로세스가 반드시 그 락을 해제__ 해야 한다.

> [참고](https://velog.io/@conatuseus/OS-%EC%84%B8%EB%A7%88%ED%8F%AC%EC%96%B4%EC%99%80-%EB%AE%A4%ED%85%8D%EC%8A%A4)

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 메모리 단편화, 페이징, 세그멘테이션


**메모리 단편화**
- 메모리의 공간이 작은 조각으로 나뉘어져서 __사용가능한 메모리가 충분히 존재하지만 할당(사용)이 불가능한 상태__

**외부 단편화**
- 메모리가 할당되고 해제되는 작업이 반복되면서 작은 메모리가 중간중간에 존재
- 이 때 중간에 생긴 사용하지 않은 메모리가 많이 존재해서 총 메모리 공간은 충분하지만 실제로 할당할수 없는 상황

**내부 단편화**
- __프로세스가 필요한 양보다 더 큰 메모리가 할당 되어서__ 프로세스에서 사용하는 메모리가 낭비되는 상황


**페이징 기법**
- 외부 단편화 해결, 내부 단편화 존재
- 가상메모리를 __같은 크기의 블록으로 나눈것을 페이지__ 라고한다.
- 물리메모리를 같은 크기의 블록으로 나눈것을 프레임이라고 한다.
<br>
- 사용하지 않는 프레임을 페이지에 옮기고, 필요한 메모리를 페이지 단위로 프레임에 옮기는 기법.
- 연속적이지 않은 공간도 활용할수 있기 때문에 외부 단편화 문제를 해결 할 수 있다.


**세그멘테이션 기법**
- 내부 단편화 해결, 외부 단편화 존재
- 가상메모리를 __서로 크기가 다른 논리적 단위인 세크멘트로 분할해서 메모리를 할당__ 하여 실제 메모리 주소로 변환을 하게 된다.
- 각 세그먼트는 __연속적인 공간에 저장__ 되어 있다.
- 세그먼트들의 크기가 다르기 때문에 미리 분할해 둘 수 없고 메모리에 적재될 때 빈공간을 찾아 할당하는 기법.

> [참고](https://jeong-pro.tistory.com/91)

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 선점스케줄링과 비선점스케줄링, 해당하는 알고리즘 한개씩

- 선점 알고리즘 : 어떤 프로세스가 CPU를 할당 받아 실행 중이더라도 OS가 CPU를 강제로 빼앗을 수 있다.

**비선점 알고리즘**
- FCF
- SJF(Shortest Job First, 실생 시간이 가장 짧은 작업부터)
- HRN(Highest Response Ratio Next, 최고 응답률 우선 스케줄링)

**선점 알고리즘**
- RR(Round Robin) : 할당받은 시간(타임 슬라이스)동안 작업 하다가 작업 미완료시 준비 큐의 맨뒤로 간다.
- SRT(Shortest Remaining Time) : SJF + RR 방식
  - 최소 잔류 시간 우선 스케줄링
  - 나은 시간이 적은 프로세스에 CPU를 먼저 할당
- 다단계 큐 스케줄링
  - 우선순위에 따라 준비 큐가 여러개
  - 상단의 큐에 잇는 모든 프로세스가 종료되야 다음 우선순위 큐의 작업이 시작된다.
- 다단계 피드백 큐 스케줄링
  - __우선순위가 낮은 프로세스에 불리한 다단계 큐 스케줄링__ 을 보완한 방식
  - CPU를 사용하고 난 프로세스는 원래 큐로 돌아가지않고, 우선순위가 하나 낮은 큐의 끝으로 들어간다.
  - 우선순위를 낮춤으로써, 다단계 큐에서 우선순위가 낮은 프로세스의 실해이 연기되는 문제를 완화한다.

**둘 다 가능**
- 우선순위 스케줄링
  - 프로세스는 중요도에 따라 우선순위를 갖는다.
  - 일정 시간마다 우선순위가 변하거나 고정되거나

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 문맥교환이란?
- CPU를 차지하던 프로세스가 나가고 새로운 프로세스를 받아들이는 작업을 말한다.
- 두 프로세스의 PCB를 교환 하는 작업
- 현재까지의 작업 상태를 저장하고 다음 작업에 필요한 각종 상태, 데이터를 읽어오는 작업
> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### PCB란?
- __프로세스를 실행하는 데 필요한 중요한 정보를 보관하는 자료구조__
- __각 프로세스가 생성될 때마다 고유의 PCB가__ 생성되고, 완료되면 제거된다.
<br>
- 프로세스는 CPU를 할당받아 작업을 처리하다가, CPU를 선점 당하게 되면 진행 중이던 작업 내용을 PCB에 저장하고 CPU를 반환한다.
- 이후에 다시 CPU를 할당받으면 PCB로 부터 진행이 끊겼던 부분에서 다시 작업을 실행한다
- 프로세스 식별자, 상태, PC(프로그램 카운터, 다음 실행할 명령의 주소 가르킴), 메모리 관리 정보 등을 가지고 있다.

> :arrow_double_up:[Top](#3-os)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#3-os)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
