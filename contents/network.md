# 2. Network
**:book: Contents**
* [tcp/udp의 차이점을 설명하라](#tcp/udp의-차이점을-설명하라)
* [흐름제어기법중 슬라이딩 윈도우 방식에대해 설명하라](#흐름제어기법중-슬라이딩-윈도우-방식에대해-설명하라)
* [브라우저에 네이버홈페이지 url을 입력했을때 일어나는 과정을 설명해라](#브라우저에-네이버홈페이지-url을-입력했을때-일어나는-과정을-설명해라)
* [OSI 7계층에대해 설명하여라](#OSI-7계층에대해-설명하여라)
* [Restful API란?](#Restful-API란?)

---
### tcp/udp의 차이점을 설명하라
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

### 흐름제어기법중 슬라이딩 윈도우 방식에대해 설명하라
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

### 브라우저에 네이버홈페이지 url을 입력했을때 일어나는 과정을 설명해라
> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### OSI 7계층에대해 설명하여라
> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### Restful API란?
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
- REST원리를 따르는 시스템을 RESTfull 이라고 지칭한다.

 > [참고](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)


> :arrow_double_up:[Top](#2-network)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#2-network)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
