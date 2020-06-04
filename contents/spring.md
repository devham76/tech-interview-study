# 8. Spring
**:book: Contents**
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

 ---

## IOC 란? (대신해줌)
- Inversion Of Control, 제어의 역행이라는 뜻
- __인스턴스의 생성 및 소멸을__ 개발자 대신 __스프링 컨테이너가__ 한다.
- 따라서 __낮은 결합도를 유지한다__
  - 사용안한다면 ,객체 사이의 의존관계를 개발자가 직접 코딩하지 않으므로
  - __코드에 의존관계가 명시되지 않아 결합도가 떨어져__ 유지보수 하기 좋다
- IoC는 Spring외에서도 사용된다

> <https://devham76.github.io/spring/Spring-IoC/>

##  DI 란? (미리 찜해 놓음)
- Dependency Injection, 의존성 주입이라는 뜻으로, IOC를 실제로 구현하는 방법.
- 객체사이의 의존관계를 __코드로 명시하는 것이 아니라__ 스프링 설정 파일에 등록된 정보를 바탕으로 __컨테이너가 자동으로 처리__ 해준다.
- XML파일을 통해 설정한대로, Bean객체 생성시 의존성 주입을 수행한다.
- 컨테이너가 직접 객체들 사이에 의존관계를 처리하는 것.

## AOP 란?
- 관점지향 프로그래밍 (Aspect Orinted Programming)
- __핵심 비즈니스 로직과__ (비즈니스 메소드마다 반복해서 등장하는) __공통 로직을 분리해서 응집도가 높게__ 개발할 수 있도록 지원한다.

- 공통으로 사용하는 기능들을 외부로 독립된 클래스로 분리

### 컨테이너
- 객체의 생성 관리를 담당하며, 객체 운용에 필요한 다양한 기능을 제공한다



## 흐름(웹브라우저에서 Spring MVC로 요청했을 떄)
- spring mvc 흐름
1. 요청된 URL을 dispatcher-servlet에 전달
2. 핸들러 매핑은 해당 URL에 매핑된 컨트롤러가 있는지 검사 후 컨트롤러에 전달
3. 해당 컨트롤러가 로직을 처리
4. 결과를 ModelAndView 객체 생성 후 담아 dispatcher-servlet에 전달
5. dispatcher-servlet은 전달 받은 View(jsp)가 있는지 검사하기 위해 ViewResolver로 보냄
6. ViewResolver는 받은 View(jsp)가 있는 지 검사 후 View로 보냄
7. View에서 Model과 같이 View(jsp)를 그린 후에 dispatcher-servlet으로 전달
8. 최종적으로 컨텐츠를 클라이언트에게 전달.

> <https://galid1.tistory.com/503?category=769011>

![spring-bean-scope](https://user-images.githubusercontent.com/55946791/81907235-6661ae00-9602-11ea-8e55-030820fee0b9.png)

1. DispatcherServlet : client로 부터 요청을 받는다
2. HandelerMapping : DispatcherServlet은 HandelerMapping을 통해서 요청을 처리할 Controller를 찾는다
3. Controller : Controller는 요청을 처리한다
4. 처리한 후에 이동할 화면정보를 리턴한다
5. ViewResolver : DispatcherServlet은 ViewResolver를 통해 접두사와 접미사가 붙은 JSP파일의 이름과 경로를 리턴받는다.
6. View : 최종적으로 JSP를 실행하고, 실행 결ㄹ과가 브라우저에 응답된다.



## Bean 객체란?
- Spring에서 POJO(plain, old java object)를 ‘Beans’라고 부른다.
- 스프링 __IoC컨테이너가 관리, 생성되는 객체__
  - 컨테이너에서 생성되었다는 점을 제외하면 일반 자바객체와 같다.
- __new를 통해 개발자가 생성한것은 Bean이 아니다__
- 이런 Bean들만 의존성이 주입된다
- 빈 등록 방법
  - 애노테이션으로 빈임을 명시 (@Component, @Service, @Cotroller, @Repository, @Configuration)
  - xml이나 자바 설정파일에 등록
- 빈 꺼내는 방법
  - @Autowired 사용

**Spring Bean 정의**
- 일반적으로 XML 파일에 정의한다.
- 주요 속성
  - class(필수): 정규화된 자바 클래스 이름
  - id: bean의 고유 식별자
  - scope: 객체의 범위 (singleton, prototype) / (ex.@Scope("singleton"))
  - constructor-arg: 생성 시 생성자에 전달할 인수
  - property: 생성 시 bean setter에 전달할 인수
  - init method와 destroy method

![spring-bean-scope](https://user-images.githubusercontent.com/55946791/81903954-8773d000-95fd-11ea-8d07-246228465860.png)

>[참고](https://gmlwjd9405.github.io/2018/11/10/spring-beans.html)

## Bean 생성 원리
스프링 부트에서는 @SpringBootApplication 어노테이션을 SpringBootApplication.run을 하는 메인 메소드가 있는 클래스 위에 붙이면 그 하위 패키지를 스캔한다. @SpringBootApplication 의 내부를 보면 @ComponentScan, @SpringBootConfiguration, @EnableAutoConfiguration 등의 어노테이션이 붙어있고 @ComponentScan 을 통해서 메인 메소드가 있는 클래스의 하위 패키지를 스캔하게 된다.

메인 메소드가 있는 클래스 하위의 @Bean, @Service, @Component, @Repo, @Controller... 등의 어노테이션이 붙은 클래스들을 빈 형태로 만들어서 빈 팩토리에서 관리하게 된다. 그리고 빈을 생성할 때 해당 빈 내부에 다른 주입이 필요한 빈이 있다면, 재귀적으로 하위에 있는 빈들을 처리하고 나서 빈을 생성후 관리하게 된다.

## Spring에서 AOP를 구현하는 3가지 방법.

JDK Dynamic Proxy 생성
Cglib 라이브러리 활용해 Proxy 생성
AspectJ 라이브러리 활용
기존 스프링에서는 인터페이스가 있으면 JDK Dynamic Proxy를 사용하고(Java Reflection 이용), 인터페이스가 없으면 CGLib Proxy를 사용했었다.(바이트코드 조작) 이제 변경되어서 스프링 부트 내부적으로 빈 생성 시 디폴트로 Cglib 프록시로 생성하게 변경되었다.

이 CGLib프록시 객체를 이용해 Transaction이나 AOP가 작동하는 것이다.

만약 굳이 JDK Dynamic Proxy를 사용하고 싶으면 @EnableAspectjAutoProxt(proxyTargetClass = true) 를 주면 JDK Dynamic Proxy를 사용할 수 있다.

AspectJ를 응용한 Compile Time Weaving도 가능하다. AspectJ를 사용하는 경우 Load Time Weaving도 가능하다.
AspectJ는 실제 바이트 코드에 대한 변조이므로 제약조건이 가장 적고 성능도 가장 좋게 나온다.
주의해야 할 점: Spring AOP에서 @AspectJ 애노테이션을 사용하는 것은 AspectJ를 통한 compile time weaving을 수행하는 것이 아니다. JDK Dynamic Proxy / CGLib 기반 Runtime weaving 하에서 AspectJ의 문법만을 갖다 쓰는 것 에 불과하다.

> [참고](https://tramyu.github.io/etc/interview/)

##  Spring을 쓰는 이유
- Spring 이전에는 EJB(Enterprise Java Beans)로 개발되었다.
- EJB는 EJB컨테이너가 제공하는 많은 기술과 장점에도 불구하고
    1. 스펙이 너무 복잡해서 __학습에 많은 시간이__ 필요하다
    2. __개발 및 유지 보수하기에 복잡하고 힘들다__
    3. 툴의 도움없이는 다루기 힘든 난해할 설정, 까다로운 패키징, 불편한 서버 배치 등 때문에 -> __고가의 느리고 무거운 자바 서버가__ 필요했다.
    4. EJB를 제대로 사용하려면 __디자인 패턴을 이해하고 적용할 수 있어야__ 한다. ( 성능 유지, 유지보수의 편의성을 위해)



- 이를 보완하기 위해 나온것이 Spring이다
    1. 평범한 POJO를 사용하면 EJB에서만 가능했던 많은 일을 가능하게 한다.
    2. 스프링 프레임워크는 이미 많은 디자인 패턴이 적용되어 배포되므로 __프레임 워크를 사용하는 것 자체가 디자인 패턴을 사용하는것이다.__
    3. 톰캣같은 기본적인 웹서버로도 운영가능하다

<br>

엔터프라이즈 시스템 개발이 너무 복잡했다.
	- 비즈니스 로직 이외에도 고려할 사항이 많았다
	- 개발이 진행도미에 따라 로직이 복잡해지고, 잦은 변경 요구가 있었기 때문이다
- 스프링은 복잡함을 해결하기 위해 DI,IoC,AOP,PSA의 특징을 가지고있다
  - IoC - 결합도 낮춰준다
  - AOP - 응집도 높혀준다

>[참고](https://galid1.tistory.com/493)

**POJO(Plain Old Java Object)**
- __객체지향의 원리에 충실하면서__
- __환경과 기술에 종속되지 않고__
- 필요에 따라 재활용될수있는 방식으로 설계된 오브젝트
  - ex) Servlet 클래스는 POJO가 아니다.
  - 왜냐하면, 우리마음대로 만들수 없고 , 규칙에 맞게 만들어야하기 때문.

## 스프링 버전 몇 사용하셨나요? (버전별 차이)
- springBootVersion 2.1.7 버전 사용해봤습니다.

### 2.3이전에는
스프링 부트 앱 만들면서 -> 웹이라는 모듈 추가하면 -> 웹이 vaildation 모듈 같이 가져왔다
###2.3부터
스프링 부트 앱 만들면서 -> 웹 추가해도 벨리데이션 모듈 가져오지 않는다

```
spring-boot-starter-validation은 기본적으로 가져오지 않는다
-> 객체가 빈값인지 확인해주는 것 , 빈값이면 badRequest나오게 test
@NotEmpty 추가 못한다
사용하고 싶다면 직접 모듈 가져올것
```

> [백기선님 유튜브 설명](https://www.youtube.com/watch?v=cP8TwMV4LjE)


* 스프링 security 사용해봤나요?
