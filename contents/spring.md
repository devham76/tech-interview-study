# 8. Spring
**:book: Contents**
 * IOC 란?
 * DI 란?
 * 흐름(웹브라우저에서 Spring MVC로 요청했을 떄)
 * Bean 객체란?
 * 스프링 디스패처 서블릿이란
 * MVC1과 MVC2 패턴의 차이
 * Bean 생성 원리
 * Spring에서 AOP를 구현하는 3가지 방법.
 * Spring을 쓰는 이유
 ---

### IOC 란?
Inversion Of Control, 제어의 역행이라는 뜻으로, 인스턴스의 생성 및 소멸을 개발자 대신 스프링 컨테이너가 한다. 그외 제어권을 프레임워크에서 가져간다는 말로도 쓰인다.

###  DI 란?
Dependency Injection, 의존성 주입이라는 뜻으로, IOC를 실제로 구현하는 방법. 의존성이 있는 컴포넌트를 개발자가 코드로 명시하는 것이 아니라 Spring이 런타임에서 연결해 처리해준다. XML파일을 통해 설정한대로, Bean객체 생성시 의존성 주입을 수행한다.

### 흐름(웹브라우저에서 Spring MVC로 요청했을 떄)
요청된 URL을 dispatcher-servlet에 전달 -> 핸들러 매핑(매핑 핸들러가 아닌듯)은 해당 URL에 매핑된 컨트롤러가 있는지 검사 후 컨트롤러에 전달 -> 해당 컨트롤러가 로직을 처리 -> 결과를 ModelAndView 객체 생성 후 담아 dispatcher-servlet에 전달 -> dispatcher-servlet은 전달 받은 View(jsp)가 있는지 검사하기 위해 ViewResolver로 보냄 -> ViewResolver는 받은 View(jsp)가 있는 지 검사 후 View로 보냄 -> View에서 Model과 같이 View(jsp)를 그린 후에 dispatcher-servlet으로 전달 -> 최종적으로 컨텐츠를 클라이언트에게 전달.

### Bean 객체란?
자바에서의 POJO(Plain Old Java Object)로, XML 설정파일을 통한 생명주기, 종속성 등의 메타데이터를 가지고 스프링 컨테이너에서 생성된 객체이다. 컨테이너에서 생성되었다는 점을 제외하면 일반 자바객체와 같다.


### Bean 생성 원리
스프링 부트에서는 @SpringBootApplication 어노테이션을 SpringBootApplication.run을 하는 메인 메소드가 있는 클래스 위에 붙이면 그 하위 패키지를 스캔한다. @SpringBootApplication 의 내부를 보면 @ComponentScan, @SpringBootConfiguration, @EnableAutoConfiguration 등의 어노테이션이 붙어있고 @ComponentScan 을 통해서 메인 메소드가 있는 클래스의 하위 패키지를 스캔하게 된다.

메인 메소드가 있는 클래스 하위의 @Bean, @Service, @Component, @Repo, @Controller... 등의 어노테이션이 붙은 클래스들을 빈 형태로 만들어서 빈 팩토리에서 관리하게 된다. 그리고 빈을 생성할 때 해당 빈 내부에 다른 주입이 필요한 빈이 있다면, 재귀적으로 하위에 있는 빈들을 처리하고 나서 빈을 생성후 관리하게 된다.

### Spring에서 AOP를 구현하는 3가지 방법.

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
