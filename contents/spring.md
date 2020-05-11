# 8. Spring
**:book: Contents**
 * IOC 란?
 * DI 란?
 * 흐름(웹브라우저에서 Spring MVC로 요청했을 떄)
 * Bean 객체란?
 * 스프링 디스패처 서블릿이란

 ---

### IOC 란?
Inversion Of Control, 제어의 역행이라는 뜻으로, 인스턴스의 생성 및 소멸을 개발자 대신 스프링 컨테이너가 한다. 그외 제어권을 프레임워크에서 가져간다는 말로도 쓰인다.

###  DI 란?
Dependency Injection, 의존성 주입이라는 뜻으로, IOC를 실제로 구현하는 방법. 의존성이 있는 컴포넌트를 개발자가 코드로 명시하는 것이 아니라 Spring이 런타임에서 연결해 처리해준다. XML파일을 통해 설정한대로, Bean객체 생성시 의존성 주입을 수행한다.

### 흐름(웹브라우저에서 Spring MVC로 요청했을 떄)
요청된 URL을 dispatcher-servlet에 전달 -> 핸들러 매핑(매핑 핸들러가 아닌듯)은 해당 URL에 매핑된 컨트롤러가 있는지 검사 후 컨트롤러에 전달 -> 해당 컨트롤러가 로직을 처리 -> 결과를 ModelAndView 객체 생성 후 담아 dispatcher-servlet에 전달 -> dispatcher-servlet은 전달 받은 View(jsp)가 있는지 검사하기 위해 ViewResolver로 보냄 -> ViewResolver는 받은 View(jsp)가 있는 지 검사 후 View로 보냄 -> View에서 Model과 같이 View(jsp)를 그린 후에 dispatcher-servlet으로 전달 -> 최종적으로 컨텐츠를 클라이언트에게 전달.

### Bean 객체란?
자바에서의 POJO(Plain Old Java Object)로, XML 설정파일을 통한 생명주기, 종속성 등의 메타데이터를 가지고 스프링 컨테이너에서 생성된 객체이다. 컨테이너에서 생성되었다는 점을 제외하면 일반 자바객체와 같다.
