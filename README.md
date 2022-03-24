# Tech Interview

**기술 면접 대비를 위한 기본 개념을 정리하는 Repository 입니다.**

> 자세한 내용은 contents 폴더에서 확인 가능하며
모든 문제에 대한 정리 & 짧은 답변은 [이곳](https://docs.google.com/spreadsheets/d/1gi9yQ_wlg2utcs15mkkktFG-0xgycFhgZvOb9KIqHH0/edit?usp=sharing)에서 확인 가능합니다.


<div align=center>

[![author](https://img.shields.io/badge/author-devham76-blue.svg)](https://github.com/devham76)
[![HitCount](http://hits.dwyl.io/devham76/tech-interview-study.svg?style=popout)](http://hits.dwyl.io/devham76/tech-interview-study)

</div>


**:book: Contents**
1. [Data Structure](#1-data-structure)
2. [Network](#2-network)
3. [Operating System](#3-operating-system)
4. [Database](#4-database)
5. [Design Pattern](#5-design-pattern)
6. [Algorithm](#6-algorithm)
7. [Java](#7-java)
8. [Spring](#8-spring)
9. [Software Engineering](#9-software-engineering)
10. [ETC](#11-etc)

---

## 1. Data Structure
:arrow_forward: [답변 내용](/contents/datastructure.md)

## 2. Network
:arrow_forward: [답변 내용](/contents/network.md)
* tcp/udp의 차이점을 설명하라
* 흐름제어기법중 슬라이딩 윈도우 방식에대해 설명하라]
* 브라우저에 네이버홈페이지 url을 입력했을때 일어나는 과정을 설명해라
* OSI 7계층에대해 설명하여라
* Restful API란?

* 3-way handshaking이란?							
* HTTP와 HTTPS의 차이는?							
* GET과 POST의 차이는?							
* TCP/IP 프로토콜 스택 4계층으로 구분짓고 설명하라							
* Session과 Cookie 차이는?							

* iocp
* http keep alive / tcp keep alive
* ssl
* tcp udp 패킷구조 차이점
* 리피터, 허브, 브릿지, 라우터와 L2, L3, L4, L7 스위치 차이점

* HTTP 자세히 설명해주세요

## 3. Operating System
:arrow_forward: [답변 내용](/contents/os.md)

- OS란 무엇이며, 핵심 기능은?
- 부팅이 되는 과정을 설명하시오.
- 프로세스의 5가지 상태에 대해 설명하시오.
- 메모리 계층 구조를 설명하시오.
- 캐시와 버퍼의 차이점은?

* 세마포어와 뮤텍스란? 차이점은 무엇인가?
* 메모리 단편화란? / 페이징과 세그멘테이션?
* 선점스케줄링과 비선점스케줄링, 그리고 해당하는 알고리즘 한개씩 말하시오
* 문맥교환이란?
* PCB란?

* 가상메모리란?
* Deadlock이란?
* 프로세스의 메모리구조?
* thrashing이란?
* 프로세스간 통신하는 방법은?
* Thread 가 3개 생성 되었을 때 t1, t2, t3의 순서가 보장 되는 코드를 짜 보세요.

## 4. Database
:arrow_forward: [답변 내용](/contents/db.md)
* Primary Key, Foreign Key, ER 모델이란?							
* 정규화에 대해서 말해보시오, 정규화의 목적은?							
* 무결성에 대해 말해보시오							
* 조인이 무엇인지?(inner, left, right, outer)							
* NoSQL이란? 기존RDBMS와 다른점은?							

<br>

* 트랜잭션이란?(+트랜잭션의 성질)
* 2단계 락킹이란?
* 공유락, 배타락이란?
* 색인이란? 색인을 사용했을때 장단점?
* 역정규화를 하는 이유는 무엇인가?

* view관련
* 어떤 이상현상 생길수있을지

* MySQL을 사용하셨다면, 어떤 엔진을 사용했나요? 왜 사용했나요?

## 5. Algorithm
### :pushpin: [알고리즘 ps](https://github.com/devham76/AlgorithmPS)
:arrow_forward: [답변 내용](/contents/algorithm.md)

* quick sort가 일어나는 과정을 설명해주세요
* insertion sort가 일어나는 과정을 설명해주세요
* DFS와 BFS의 차이를 말해주세요
* 이분 탐색 알고리즘에 대해 설명해주세요
* 알고있는 정렬 알고리즘과 그 중 좋아하는 정렬알고리즘 설명해주세요

* 두개의 stack을 이용해 queue를 구현하라							
* LinkedList의 원소를 역순으로 출력하는 방법은?							
* tree와 graph를 설명하라							
* 해싱의 충돌을 해결하는 방법들을 설명하라							
* huffman encoding에 대해 설명하라							

* 벨만포드 알고리즘과 다익스트라 알고리즘의 차이점?
* MST 알고리즘(Spanning Tree란?)
* 프림
* 크루스칼
* Floyd-Warshall 알고리즘

* 프라이어리티 큐의 구조 설명
* heap에서 delete 과정을 그려라
* 16진수 수를 10진수로 변경하는 코드를 작성해보세요
* 이진트리, 이진 검색트리, 힙이 각각 무엇인지 설명해주세요
* 해시테이블과 이진 검색트리를 비교하고 장단점을 이야기해주세요
* 메모리가 제한된 모바일 기기용 주소록에 사용할 자료구조를 설계한다면 어느쪽을 쓰는것이 좋을까요?

* 해쉬 테이블/큐/스택을 구현해주세요
* 트리/링크드리스트 구현해주세요

## 6. Java
:arrow_forward: [답변 내용](/contents/java.md)

* 자바 컴파일 과정을 설명하라
* String, StringBuffer, StringBuilder의 차이점에 대해 설명하라
* OOP의 4가지 특징
* 오버로딩과 오버라이딩의 차이
* HashMap과 TreeMap의 차이

* GC에 대해 설명하라							
* 자바의 메모리구조는?							
* 동등성(equals)과 동일성(==)에 대해 설명하라							
* 제네릭과 와일드카드에 대해 설명하라							
* 멀티스레딩환경에서 동기화문제를 해결하는 방법에대해 설명하라 (syncronized, atomic, volatile)							

<br>

* java의 접근 제어자의 종류와 특징 설명해주세요
* non-static 멤버와 static멤버의 차이 설명해주세요
* final 키워드 (final/finally/finalize) 설명해주세요
* 인터페이스와 추상 클래스의 차이(Interface vs Abstract Class) 설명해주세요
* set, list, map의 차이와 각각의 인터페이스 구현체의 종류를 설명해주세요

<br>

* java8을 써보셨나요? java7에서 8로 올라오면서 어떤게 달라졌나요?
* this 키워드
* 자바에서 tcp udp 소켓 생성 방법
* 리틀엔디안 빅엔디안
* Reflection
* oop 5대 원칙

## 7. Spring
:arrow_forward: [답변 내용](/contents/spring.md)
* IOC 란?
* DI 란?
* AOP 란?
* 흐름(웹브라우저에서 Spring MVC로 요청했을 떄)
* Bean 객체란?
* 스프링 디스패처 서블릿이란
* MVC1과 MVC2 패턴의 차이
* Bean 생성 원리
* Spring에서 AOP를 구현하는 3가지 방법.
* Spring을 쓰는 이유


* 스프링 버전 몇 사용하셨나요? (버전별 차이)
* 스프링 security 사용해봤나요?

## 8. Software Engineering
:arrow_forward: [답변 내용](/contents/software-engineering.md)
* sw공학이란? 필요한 이유? 좋은 설계란?
* 형상관리란?
* Singleton, Adapter, Template패턴은 어떤 것인가? 왜 사용하는지? 코드 구현해보시오
* 코드 결합도와 응집도란?
* 블랙박스/화이트박스 테스트란?

* Agile 방법론이 무엇인지 설명해주세요							
* 소프트웨어 생명 주기 모델은 무엇이고 어떤 모델이 있는지 설명해주세요							
* CVS, SVN, GIT에 대해서 아는대로 설명해 보시오.							
* 형상 관리를 잘못하면 어떤 문제가 발생하나요?							
* 객체지향과 절차지향 차이 설명해주세요

<br>

* MVP패턴, MVVM패턴이란?
* TDD란?
* Java에서 Builder 패턴을 사용하는이유는?
* Observer 패턴은?
* Java에서 팩토리 메서드 패턴을 사용하는 이유는?


## 9. ETC
:arrow_forward: [답변 내용](/contents/etc.md)

* sass lass pass
* Docker란 무엇인가요? 왜 사용하나요?
* AWS를 사용해 본 경험이 있나요?
* XML, json 차이
* 최근 관심 있는 인터넷 이슈는 무엇인가요?
* HTTP와 HTTP2의 차이 + HTTP3
* apache와 nginx차이

## 10. 기술 외의 질문
* 어떤 역할을 맡았고, 무슨 기술을 썼으며, 어떤 어려움이 있었고 어떻게 해결했는지
* 작성한 프로젝트의 보안은 어떻게 신경썼나요?
* 코딩테스트문제에서 뭐가 인상깊거나 아쉬웠는지 간단히
* 어떤 실패를 했고 어떻게 극복했고 어떤것을 얻었는지
* 대용량 데이터 처리를 위한 서비스 아키텍처에 대해 설명해 주세요. 그에 대한 기술도 함께 말씀해 주세요.
* 무슨과목좋아하는지
* 챗봇은 어떤엔진으로 구축햇는지
* 우리회사에서 뭐하고싶은지
* 알림톡데몬 유지보수
* 개발이좋은지 유지하는게좋은지?
* 전산이 적성에맞는지

* 저희 회사에 대해 궁금한건 질문 해보세요

:arrow_forward: [답변 내용](/contents/experience.md)

---

# Reference
