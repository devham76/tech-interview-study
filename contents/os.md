# 3. Operating System
**:book: Contents**

- [OS란 무엇이며, 핵심 기능은?](#OS개념과-핵심-기능)
- [부팅이 되는 과정을 설명하시오.](#부팅이-되는-과정)
- [프로세스의 5가지 상태에 대해 설명하시오.](#프로세스의-5가지-상태)
- [메모리 계층 구조를 설명하시오.](#메모리-계층-구조)
- [캐시와 버퍼의 차이점은?](#캐시와-버퍼의-차이점)
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
1. 생성 : 프로세스 생성 상태
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
