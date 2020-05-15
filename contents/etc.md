# 10. ETC
**:book: Contents**

* sass lass pass
* Docker란 무엇인가요? 왜 사용하나요?
* AWS를 사용해 본 경험이 있나요?
* XML, json 차이
* 최근 관심 있는 인터넷 세상의 이슈는 무엇인가요?
* HTTP와 HTTP2의 차이
* apache와 nginx차이
---

## sass lass pass

1. SaaS, 사스
- Software as a Service
- 소프트웨어 서비스
- 구글드라이브, 드랍박스, 와탭 등

2. PaaS, 파스
- Platform as a Service
- IaaS에서 한번 더 추상화한 서비스
- 한번 더 추상화했기 때문에 __많은 기능이 자동화__ 되어 있다
- AWS Beanstalk, Heroku등

3. IaaS, 아이아스 ,이에스
- Infrastructure as a Service
- 기존 물리 장비를 미들웨어와 함께 묶어둔 추상화 서비스
- 가상머신, 스토리지, 네트워크, 운영체제 등의 __it인프라를 대여해주는 서비스__
- AWS EC2, S3등

## framework library
프레임워크 : 특정 프로그램을 개발하기 위한 여러 요소들과 메뉴얼인 룰을 제공하는 프로그램
라이브러리 : 프로그램을 개발하기 위해 쓰는 공구와 같은 도구들
공통점 : 프로그램을 쉽게 만들 수 있게 하는 공통된 목적이 있음
차이점 : 자유도, 프레임워크는 꼭 써야되는 것과 지켜야되는 룰이 있다. 라이브러리는 쓰든 안 쓰든 자기 마음이다.

> [참고](https://engkimbs.tistory.com/673?category=763578)

## Platform
많은 사람이 쉽게 이용하거나 다양한 목적으로 사용된다
- 소프트웨어에선 “여러가지 기능을 제공해주는 공통 실행환경”을 플랫폼이라고도 말하게도 되었습니다.
- “서비스플랫폼”이란 다른 서비스들이 내 서비스를 쉽게 활용할 수 있게 해도록 해주는 인터넷 기반의 기술 환경을 말합니다.
![플랫폼이란](https://user-images.githubusercontent.com/55946791/82056589-1e738180-96fd-11ea-9668-a1711be664c2.JPG)
- ex)
	- 교통 플랫폼 : 우버 - 차량 소유자와 이동필요한 수요자를 모바일 앱으로 연결
	- 모바일 메신저 플랫폼 : 카톡,라인 - 스마트폰 무료 메신저 서비스가 다양한 거래와 사업의 기반이 된다
	- 배달 플랫폼 : 배달의민족 - 배달음식점과 손님을 연결
>[참고1](https://brunch.co.kr/@xhrkdl2000/3)
>[참고2](https://subokim.wordpress.com/2013/01/31/platform-story/)

## 크롤링이란 ?
- Web상에 존재하는 Contents를 수집하는 작업
- HTML 페이지를 가져와서, HTML/CSS등을 파싱하고, 필요한 데이터만 추출하는 기법
- Open API(Rest API)를 제공하는 서비스에 Open API를 호출해서, 받은 데이터 중 필요한 데이터만 추출하는 기법
- Selenium등 브라우저를 프로그래밍으로 조작해서, 필요한 데이터만 추출하는 기법

<br>
- java에서는 Jsoup(제이숩), Selenium(셀레니움)을 사용할수있다.

|Jsoup|Selenium|
|--|--|
| 정적웹페이지 파싱시 적합 | 동적웹페이지 파싱시 적합|
| client side rendering | server side rendering|
| 빠른 응답 | (브라우저가 랜더링 된 후에 수집하기 때문)jsoup보단 느리다 |

- 내 프로젝트는 동적페이지를 파싱하는것이 아니므로 jsoup을 사용했다.

```java
String url1 = "https://devham76.com";

// 1. jsoup / html 태그 파싱필요
Document doc = null;
doc = Jsoup.connect(url1).get();	// HTML문서 가져온다

// div의 id=underpins_ul인 li값들을 가져온다
Elements elements = doc.select("div #underpins_ul li");
System.out.println(elements);

// 그것들의 text만 가져온다
String str = elements.text();
System.out.println(str);

// 2. URL, openStream -> String으로 결과
URL url2 = new URL(url1);
BufferedReader br = new BufferedReader(new InputStreamReader(url2.openStream()));
StringBuilder sourceCode = new StringBuilder();

String sourceLine;
while ((sourceLine = br.readLine()) != null) {
  sourceCode.append(sourceLine + "\n");
}

// 3. Selenium
```


## Apache와 Nginx

|Apahce | Nginx|
|--|--|
|요청당 쓰레드(or 프로세스)가 처리|비동기 이벤트 기반 요청을 처리 |
|안정성 , 확장성, 호환성 | 성능 (대량접속에도 적은 리소스 사용, 빠르다)|
|요청이 많을수록 cpu,메모리 사용증가로 인한 <br>성능저하|적은 수의 쓰레드로 효율적인 일 처리, 문맥교환 비용적다<br>cpu 소모 적다 |
