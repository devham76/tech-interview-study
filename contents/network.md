# 2. Network
**:book: Contents**
* [tcp/udp의 차이점을 설명하라](#tcp/udp의-차이점을-설명하라)
* [흐름제어기법중 슬라이딩 윈도우 방식에대해 설명하라](#흐름제어기법중-슬라이딩-윈도우-방식에대해-설명하라)
* [브라우저에 네이버홈페이지 url을 입력했을때 일어나는 과정을 설명해라](#브라우저에-네이버홈페이지-url을-입력했을때-일어나는-과정을-설명해라)
* [OSI 7계층에대해 설명하여라](#OSI-7계층에대해-설명하여라)
* [Restful API란?](#Restful-API란?)

* [3-way handshaking이란?](#3-way-handshaking이란?)
* [HTTP와 HTTPS의 차이는?](#HTTP와-HTTPS의-차이는?)
* [GET과 POST의 차이는?](#GET과-POST의-차이는?)
* [TCP/IP 프로토콜 스택 4계층으로 구분짓고 설명하라](#TCP/IP-프로토콜-스택-4계층으로-구분짓고-설명하라)			
* [Session과 Cookie 차이는?](#Session과-Cookie-차이는?)

---
* [iocp](#iocp)
* [http keep alive / tcp keep alive](#http-keep-alive-/-tcp-keep-alive)
* [ssl](#ssl)
* [tcp udp 패킷구조 차이점](#tcp-udp-패킷구조-차이점)
* [리피터, 허브, 브릿지, 라우터와 L2, L3, L4, L7 스위치 차이점](#리피터,-허브,-브릿지,-라우터와-L2,-L3,-L4,-L7-스위치-차이점)

---

## tcp/udp의 차이점을 설명하라
![tcp udp](https://user-images.githubusercontent.com/55946791/81063602-1ce2d600-8f13-11ea-99e5-f089ca7ccc0c.jpg)
**공통점**
- 데이터 전달을 담당하는 전송계층의 프로토콜이다

**TCP**
- __연속성보다 신뢰성 있는 전송이 중요할때 사용__
- 발신지와 수신지를 연결하여 패킷을 전송하기 위한 논리적 경로를 배정하는 가상회선 방식 제공한다.
- 3-way handshaking을 통해 연결하고 4-way handshaking을 통해 해제한다.
- 흐름제어 및 혼잡 제어
- 높은 신뢰성 보장
- 전이중, 점재점 방식

**UDP**
- __신뢰성보다 연속성이 중요한 서비스에 사용(ex. streaming)__
- 비연결형 서비스로 데이터그램 방식을 제공
- 정보를 주고 받을대 신호절차 없음
- UDP헤더의 CheckSum필드를 통해 최소한의 오류만 검출
- 신뢰성 낮다


| | TCP| UDP|
|--|--|--|
|연결방식 | 연결형 서비스| 비연결형 서비스|
|패킷 교환 방식| 가상 회선 방식| 데이터그램 방식|
|전송 순서| 전송 순서 보장| 전송 순서가 바뀔수있다||
|수신 여부 확인| 수신여부 확인 | 수신 여부 확인x|
|통신 방식 | 1:1통신 | 1:1 or 1:N or N:N 통신|
|신뢰성| 높다| 낮다|
|속도| 느리다| 빠르다|

> <https://mangkyu.tistory.com/15>

> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 흐름제어기법중 슬라이딩 윈도우 방식에대해 설명하라
- TCP는 신뢰성을 유지하기 위해 흐름제어, 혼잡제어, 오류제어를 한다.

**흐름 제어**
- 수신측과 송신측의 데이터 처리 속도 차이를 해결하기 위한 기법
- 송신측 전송량 > 수신측 처리량 일때, __송신측 패킷 전송량을 제어한다.__
- 정지-대기, 슬라이딩 윈도우가 있다.

**정지-대기**
![stop_and_wait](https://user-images.githubusercontent.com/55946791/81066245-c6c46180-8f17-11ea-9f6a-1b4af02ea729.png)
- 매번 전송한 패킷에 대해 응답을 받아야만 다음 패킷을 전송할수있다.
- 간단한 구조, 비효율적

**슬라이딩 윈도우**
- 전송측이 전송한 프레임에 대한 ACK프레임을 수신하지 않아도, 여러 개의 프레임을 연속적으로 전송하도록 허용하는 방법이다.
- __슬라이딩 윈도우 기법을 통해서 송신 버퍼의 범위는 수신측의 여유 버퍼 공간을 반영하여 동적으로 바뀜으로써 흐름제어를 수행한다__
<br>
- 윈도우는 전송, 수신 스테이션 양쪽에서 만들어진 버퍼의 크기이다.
- 윈도우의 크기 = (가장 최근 ACK로 응답한 프레임의 수) - (이전에 ACK 프레임을 보낸 프레임의 수)
- ACK 프렝임을 수신하지 않아도 여러 개의 프레임을 연속적으로 전송할 수 있다.

**슬라이딩 윈도우 과정**
![error_flow_control_2](https://user-images.githubusercontent.com/55946791/81066242-c62bcb00-8f17-11ea-85fd-b99be68a627b.png)
- 데이커 0,1 전송했다고 가정하면 아래 처럼 변경된다
- 윈도우의 크기는 전송한 데이터 프레임 만큼 왼쪽 경계가 줄어든다.

![error_flow_control_3](https://user-images.githubusercontent.com/55946791/81066249-c75cf800-8f17-11ea-814c-d0410e827c25.png)
- 이때 수신측에서 ACK 프레임을 전송하고 수신하면 되면 전송측은 0과 1데이터를 정상적으로 받았음을 알게되고
- 전송측은 ACK 프레임에 따른 프레임의 수만큼 오른쪽으로 경계가 확장된다.

![error_flow_control_4](https://user-images.githubusercontent.com/55946791/81066742-8addcc00-8f18-11ea-8a54-af8e34be5255.png)

> - <https://woovictory.github.io/2018/12/28/Network-Erro-Flow-Control/>
> - <https://wildpup.cafe24.com/archives/469>

> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 브라우저에 네이버홈페이지 url을 입력했을때 일어나는 과정을 설명해라
> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## OSI 7계층에대해 설명하여라
![osi](https://user-images.githubusercontent.com/55946791/81579041-99c7f100-93e6-11ea-961f-0ba2d2962ad6.gif)

- OSI 7 Layer 란 통신 접속에서 완료까지의 과정을 7단계로 정의한 국제 통신 표준 규약으로 다음과 같이 분류된다.
- 물리계층 : 전송하는데 필요한 기능을 제공. 장비로는 통신 케이블, 허브가 존재한다.
- 데이터링크계층 : 송/수신을 확인. MAC Address를 가지고 통신. 장비로는 브릿지와 스위치가 존재한다.
- 네트워크계층 : 패킷을 네트워크 간의 IP를 통하여 데이터를 전달, 장비로는 라우팅이 존재한다.
- 전송계층 : 두 호스트 시스템으로부터 발생하는 데이터의 흐름을 제공한다.
- 세션계층 : 통신 시스템 사용자간의 연결을 유지 및 설정한다.
- 표현계층 : 세션 계층 간의 주고받는 인터페이스를 일관성 있게 제공한다.
- 응용계층 : 사용자가 네트워크에 접근할 수 있도록 서비스를 제공한다.
> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## Restful API란?
**REST의 구체적 개념**
- __HTTP URI를 통해 자원을 명시하고, HTTP METHOD를 통해 자원에 대한 CRUD를 적용하는 것을 의미한다.__
- 자원(URI) + 행위(HTTP Method) + 표현
- _자원_ : client는 URI를 이용해서 자원을 지정하고 해당 자원에 대한 조작을 server에 요청하낟
- _행위_ : GET, POST, PUT, DELETE
- _표현_ : JSON, XML를 통해 데이터를 주고 받는 것이 일반적이다.


**API(Application Programming Interface)**
-  데이터와 기능의 집합을 제공하여 컴퓨터 프로그램간 상호작용하고 서로 데이터 교환을 가능하게 하는것

**REST API**
- REST 기반으로 서비스 API를 구현하는것

**RESTful**
- REST원리를 따르는 시스템을 RESTful 이라고 지칭한다.

 > [참고](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)


> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 3-way handshaking이란?
![3-way handshaking2](https://user-images.githubusercontent.com/55946791/81298003-1db06f00-90af-11ea-8721-e3f2c14f6255.png)
- client와 server 사이에 논리적인 접속을 성립하기 위해 사용한다.
- TCP/IP프로토콜을 이용해서 통신하는 응용프로그램이 데이터를 전송하기 전에 먼저 정확한 전송을 보장하기 위해 상대방 컴퓨터와 사전에 세션을 수립하는 과정
- client와 server 모두 데이터를 전송할 준비가 되었다는 것을 보장하는것
<br>
- Client > Server : TCP SYN  
	- Client -> SYN_SNET상태
- Client < Server : TCP SYN ACK
	- Server -> SYN_RECEIVED
- Client > Server : TCP ACK
	- Server -> ESTABBLISHED

> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## HTTP와 HTTPS의 차이는?

![https](https://user-images.githubusercontent.com/55946791/81301250-c365dd00-90b3-11ea-90e5-95749b593209.png)

**HTTP**
HTTP는 인터넷에서 웹 서버와 사용자 측의 웹 브라우저 사이에 문서를 전송하기 위한 프로토콜이다
인터넷에서 HyperText를 전송하기 위해 사용하는 프로토콜이다

**HTTP의 문제점**
HTTP는 정보를 단순 텍스트로 주고 받기 때문에 (암호화X) N/W상에서 전송 신호를 인터셉트하는 경우 데이터 유출이 발생할수있다.

**HTTPS**
- SSL이나 TLS 프로토콜을 사용하여 데이터를 암호화한다
- HTTPS는 초기에 C,S가 통신을 하며 암호화 키를 서로 안전하게 주고 받는다.(SSL Handshake)
- 이때 암호화 키값이 노출되지 않도록 안전하게 해주는게 https 서버 인증서이다.
<br>
- SSL(보안 소켓 계층)을 사용함으로써 서버와 브라우저 사이에 안전하게 암호화된 연결을 만든다
- TLS(전송 계층 보안) 프로토콜을 통해서도 보안을 유지한다.
	- TLS는 데이터 무결성을 제공하기 때문에 데이터가 전송 중에 수정,손상되는것을 방지한다

**SSL**
![https2](https://user-images.githubusercontent.com/55946791/81301245-c234b000-90b3-11ea-910d-9d6112941dba.png)

> [참고](https://wayhome25.github.io/cs/2018/03/11/ssl-https/)

> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## GET과 POST의 차이는?							

**GET**
- 주로 조회 할때 사용된다
- 요청데이터를 URL에 파라메터로 담아서 전송한다
- URL에 데이터를 포함해서 전달하므로 전송하는 길이에 제한이있다
- 정적 컨텐츠를 요청하면, 브라우저가 요청을 캐싱해두고 동일 요청이 들어오면 캐싱된 데이터를 전송

**POST**
- 서버의 상태나 데이터를 생성할때 상용된다
- 요청 정보를 BODY에 담는다
- 요청 BODY는 길이 제한이 없기 때문에 GET과 달리 대용량 데이터 전송 가능
- 요청 헤더의 Content-Type에 요청 데이터의 타입을 표시해야한다

> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## TCP/IP 프로토콜 스택 4계층으로 구분짓고 설명하라
- LINK 계층(네트워크 인터페이스 계층)
	- 물리적인 영역의 표준화에 대한 결과. LAN,WAN,MAN과 같은 NW표준과 관련된 프로토콜을 정의하는 영역
  - 물리적 네트워크를 통한 실제 송수신 담당
	- 데이터 링크 계층과 물리 계층

- IP(인터넷 계층)
	- 경로검색을 해주는 계층
	-  IP자체는 비연결지향적이며 신뢰할 수 없는 프로토콜
	- 데이터를 전송할 때마다 거쳐야 할 경로를 선택해주지만 그 경로는 일정하지 않다
	- 특히 데이터 전송 도중에 경로상의 문제가 발생하면 다른 경로를 선택해주는데, 이 과정에서 데이터가 손실되거나 오류가 발생하는 등의 문제가 발생할수있고 , 이를 해결해주진않는다.
	- 즉, 오류발생에 대한 대비가 되어있지 않은 프로토콜이다.
<br>
  - 논리 주소인 IP주소를 사용하여 데이터를 목적지 호스트 까지 전달
  - 전세계적으로 유일성 보장

- TCP/UDP(전송) 계층
	- 데이터의 실제 송수신을 담당한다
	- UDP는 TCP에 비해 상대적으로 간단하다
	- TCP는 신뢰성 있는 데이터의 전송을 담당한다
	- TCP가 데이터를 보낼 때 기반이 되는 프로토콜은 IP이다.
	- IP 계층은 문제 발생시 해결하지않아서 신뢰성이 없다.
	- 이 문제를 해결해주는 것이 TCP이다
	- 데이터가 순서대로 전송됬는지 확인하며 대화를 주고 받는다
	- 확인절차를 걸쳐서 신뢰성 없는 IP에 신뢰성을 부여하는 프로토콜이라고 생각하면 된다

- APPLICATION 계층
	- 이러한 서버와 클라이언트의 프로그램 성격에 때라 데이터 송수신에 대한 규칙이 정해지는데 이를 가리켜 Application 프로토콜이라고 한다
	- 어플리케이션 계층, 표현 계층, 세션 층

---


> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## Session과 Cookie 차이는?

**쿠키와 세션 사용하는 이유**
- HTTP는 Connectionless(클라이언트가 요청후 응답 받으면 연결 해제), Stateles(통신이 끝나면 상태를 유지하지 않는 특징) 특성이 있다.
- 따라서 Server, Client가 통신할때마다 Server는 Client가 누구인지 인증을 계속해야한다.
- ex) 쿠키와 세션을 사용하지 않으면 쇼핑몰에서 옷을 구매하려고 최초 로그인을 했음에도, 페이지를 이동할 때 마다 계속 로그인을 해야한다.
왜냐하면, 서버는 클라이언트가 누군지 기억하지 않기 때문
- 쿠키와 세션을 통해 서버는 클라이언트에 대한 인증을 유지한다 (기억하고 있는다)

**쿠키**
- Client측(브라우저)에서 관리되는 작은 기록정보 파일
- 사용자 인증에 유효한 시간 명시가능, 브라우저 종료되도 인증 유지

**쿠키 동작**
1. 클라이언트가 페이지 요청
2. 서버에서 쿠키 생성
3. HTTP헤더에 쿠키 포함 시켜 응답
4. 브라우저가 종료되어도 쿠키 만료 기간이 있다면 __클라이언트에서 보관__
5. 쿠기가 존재하면 요청시, HTTP헤더에 쿠키를 함께 보내서 요청
6. 서버에서 쿠키를 읽어 이전 상태 정보를 변경 할 필요가 있으면, 쿠키를 업데이트하여 변경된 쿠키를 HTTP헤더에 포함시켜 응답

-> 브라우저 종료시에도 남을수있다

**쿠키 사용**
- 방문 사이트에서 로그인 시, "아이디, 비밀번호 저장하겠습니까?"
- 쇼핑몰 장바구니 기능

**세션**
- 사용자 정보 파일을 브라우저에 저장하는 쿠키와 달리 세션은 __서버 측__ 에서 관리
- 서버에서 Client를 구분하기 위해 __세션 ID__ 를 부여
- 웹 브라우저가 서버에 접속해서 브라우저 종료할때 까지인증상태 유지
- __사용자 정보를 서버에 저장하기 때문에 쿠키보다 보안에 좋다__
- __사용자가 많아질수록 서버 메모리를 많이 차지하게 된다__

-> 브라우저가 종료되면 없어진다

**세션 동작**
1. 클라이언트가 세버에 접속 시 세션ID 발급
2. 클라이언트는 세션ID에 대해 쿠키를 사용해서 저장(쿠키 이름 = JSESSIONID)
3. 클라이언트가 서버에 다시 접속 시 이 쿠키를 이용해서 세션 ID 값을 서버에 전달

**세션 사용**
- 로그인과 같이 보안상 중요한 작업을 수행할 때 사용

**둘의 차이**
- __사용자의 기록 정보가 저장되는 위치__ : 쿠키-브라우저, 세션-서버
- __보안__ : 세션이 서버에서 관리 되므로 더 좋다.
- __요청속도__ : 쿠키가 빠르다. 세션은 서버에서 처리가 필요하기 때문이다.

> [참고](https://victorydntmd.tistory.com/34)
> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


## iocp
> :arrow_double_up:[Top](#2-network)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## http keep alive / tcp keep alive

**TCP keepalive**
- 서버간에 ACK 패킷을 보내 세션 테이블이 지워지지 않고 계속 __세션 정보를 유지__
- mq, kafka 등 TCP 기반의 서비스들을 대상으로 __지속적 연결을 유지해야 하는 경우__ 사용
- 과정
	1. A – B가 서로 Connection이 Establish된 상태에서 (3-handshake)
	2. 지정된 시간(OS 설정 값 또는 어플리케이션 설정) 동안 서로 패킷 교환(Exchange)이 없을경우
	3. payload가 없는 패킷을 보냅니다.
	4. 패킷에 반응없으면 접속 close

- 언제사용하지?
	- 한쪽만 연결되어있는 상태를 정리하기 위해 사용

```
1. Checking for dead peers

A – B가 연결된 경우 B시스템이 장애로 인해서 restart 될 경우
A의 keep-alive 설정에 의해서 probe 패킷을 보내면
B는 RST(Reset)을 응답 합니다.

이럴 경우 B 시스템의 커넥션이 끊겼다는 것을 감지 할 수 있습니다.

※ TCP 프로토콜 자체에서 장애 감지가 없기 때문에 Keepalive 옵션을
통해서 감지
```


**HTTP Keepalive**
- http 는 특성상 커넥션을 유지하지 않는다.
- 따라서 KeepAlive를 사용해서 __커넥션을 유지해서 빠르게 데이터 주고받을__ 수 있다.
- 일정시간이 지나면 __능동적으로 연결을 끊는다.__
- 너무 많은 연결을 오래 유지하면, 다른 연결에 방해를 줄수있다.
<br>
- Apache, Nginx 등 웹 애플리케이션에서 __설정된 기간까지 최대한 연결을 유지하기 위해__ 사용된다.

- HTTP 1.1부터 keepalive를 default로 제공한다


> :arrow_double_up:[Top](#2-network)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## ssl
- HTTP의 보안 문제를 해결해준다. SSL이 적용되어 HTTPS라고 칭한다
- http와 tcp사이에 있는 인증서. TLS가 정식명칭이나, SSL이라고 부른다
- 동작
	1. Server측에서 CA(인증기관)에 사이트정보+공개키를 주고 인증서를 요청한다
	2. CA에서 심사완료 후 사이트정보+공개키를 개인키로 암호화 하고 공개키를 브라우저에 등록한다
	3. 브라우저가 서버에 인증서를 요청한다
	4. 인증서가 CA에서 인증받은것인지 브라우저가 확인하고 공개키를 이용해서 서버측 사이트정보+공개키를 획득한다
	5. 클라이언트의 대칭키를 서버측의 공개키로 암호화 해서 서버에게 전송한다
	6. 서버는 자신의 개인키로 복호화하여 클라이언트 측의 대칭키를 획득한다 -> 그러면, 대칭키는 클라이언트,서버만 갖게 된다
	7. 이 대칭키로 암호화,복호화하여 통신한다
> <https://soul0.tistory.com/372>

> :arrow_double_up:[Top](#2-network)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## tcp udp 패킷구조 차이점
![TCP패킷](https://user-images.githubusercontent.com/55946791/81794325-94cd8380-9545-11ea-938a-ab551f055ace.png)
![UDP (1)](https://user-images.githubusercontent.com/55946791/81794335-96974700-9545-11ea-8c04-13c1fb79bd37.png)


> :arrow_double_up:[Top](#2-network)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 리피터, 허브, 브릿지, 라우터와 L2, L3, L4, L7 스위치 차이점
- 리피터
	- 리피터 란? 근거리통신망(LAN)의 전송매체상에 흐르는 신호를 정형, 증폭, 중계하는 장치
- 허브
	- 다수의 pc와 장치들을 묶어서 LAN을 구성할때 한곳으로 모으는 역할, 플러딩 발생한다
- 브릿지
	-  데이터 링크 계층에 있는 여러 개의 네트워크 세그먼트를 연결해 준다
	-  들어오는 데이터 패킷을 분석하여 브리지가 주어진 패킷을 다른 세그먼트의 네트워크로 전송할 수 있는지를 결정할 수 있다.
- 라우터
	- 어드레싱과 라우팅을 한다
	- 어드레싱 : MAC주소를 알아낸다
	- 라우팅 : 다음 목적지의 경로를 알아낸다
- 스위치
	-  OSI의 7 레이어 중 어떤 레이어에서 수행되는가에 따라 정의된 분류이다.
	- <https://ngg3319.tistory.com/102>

> :arrow_double_up:[Top](#2-network)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
