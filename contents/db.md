# 4. Database
**:book: Contents**
* [Primary Key, Foreign Key, ER 모델이란?](#Primary-Key,-Foreign-Key,-ER-모델)			
* [정규화에 대해서 말해보시오, 정규화의 목적은?](#정규화에-대해서-말해보시오,-정규화의-목적은?)
* [무결성에 대해 말해보시오](#무결성에-대해-말해보시오)					
* [조인이 무엇인지?(inner, left, right, outer)](#조인이-무엇인지?)
* [NoSQL이란? 기존RDBMS와 다른점은?](#NoSQL이란?-기존RDBMS와-다른점은?)

<br>

* [트랜잭션이란?(+트랜잭션의 성질)](#트랜잭션이란?(+트랜잭션의-성질))
* [2단계 락킹이란?](#2단계-락킹이란?)
* [공유락, 배타락이란?](#공유락,-배타락이란?)
* [색인이란? 색인을 사용했을때 장단점?](#색인이란?-색인을-사용했을때-장단점?)
* [역정규화를 하는 이유는 무엇인가?](#역정규화를-하는-이유는-무엇인가?)



---
## Primary Key, Foreign Key, ER 모델

**Key 종류**
<img width="398" alt="db 키종류" src="https://user-images.githubusercontent.com/55946791/81372469-66127000-9135-11ea-8eda-78d06205cfaa.png">

- Super key : 유일성 O,  최소성 X
- Candidate key : 유일성 O, 최소성 O (키의 집합에서 하나라도 삭제하면 유일성 만족하지 못하는 성질)
- Primary key : 후보 키 중에서 선정된 키. 유일성 O, 최소성 O / Null값 가질수 없다
- Alternate Key : 후보 키에서 기본키를 뺀 모든 후보 키
- Foreign Key :  다른 테이블의 Primary key를 참조하는 컬럼

**ER 모델**
- Entity Relation Model
![er모델](https://user-images.githubusercontent.com/55946791/81372824-40399b00-9136-11ea-9dff-889b52f5da33.png)
- 개체(Entity), 애트리뷰트(Attribute), 관계성(Relation)으로 기술하는 데이터 모델을 말한다.

> [참고](https://victorydntmd.tistory.com/126)

## 정규화에 대해서 말해보시오, 정규화의 목적은?

**DB 정규화란 ?**
- RDBMS의 설계에서 중복을 최소화하여 데이터를 구조화하는 프로세스
- 연관성 있는 속성들을 분류하여, 각 릴레이션들에 이상현상이 생기지 않도록 하는 과정
- 정규형에는 1NF, 2NF, 3NF, BCNF, 4NF, 5NF, 6NF 까지 있다 (보통 3정규형 까지 되어있으면 정규화 되었다고 한다)

**정규화 종료**
- 1NF
- 2NF
- 3NF
-  

**DB 정규화가 필요한 이유?**
- DB설계를 잘못 하면 불필요한 데이터 중복으로 인해 공간이 낭비되고 부작용을 초래할수있다.
- 이러한 부작용을 이상(Anomaly)이라고 한다.
- 삽입이상, 갱신이상, 삭제이상이 있다.

**이상 예제**
- 기본키 : student_id, course_id
![db 정규화 예제](https://user-images.githubusercontent.com/55946791/81373708-56485b00-9138-11ea-9720-fc4f170775b9.JPG)

**삽입 이상**
- 세 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야 하는 문제
- ex )  아직 수업을 하나도 수강하지 않은 학생이 있다고 가정하자. 현재 KEY 를 학번과 과목코드로 지정해 놓았고 기본키로 쓰이는 컬럼은 NULL 이 될 수 없으므로 그 학생은 이 테이블에 추가 될 수가 없다. 굳이 삽입하려면 ‘미수강’ 같은 과목코드를 새로 만들어서 삽입해야 한다.

**갱신 이상**
- 중복 튜플 중 일부만 변경하여 데이터가 불일치하게 되는 모순
- ex ) 야붕이 컴퓨터공학이 싫어서 음악학부로 옮기게 되는경우 ‘컴퓨터공학부’ 의 갯수는 과목코드의 갯수만큼 있으므로 모두 ‘음악학부’ 로 변경해주어야 한다. 이때 모두 변경하지 않고 두개만 바꾸는 경우 야붕은 컴퓨터공학부인지 음악학부인지 알 수 없게 된다.

**삭제 이상**
- 튜플을 삭제하면 꼭 필요한 데이터까지 함께 삭제되는 데이터 손실의 문제
- ex ) 모찌가 수강정정기간에 MEC011101 라는 수업을 듣기 싫어져서 드랍하는 경우, 위 테이블에 반영하기 위해서는 모찌에 대한 행을 모두 삭제하게 된다. 수강취소를 반영하기 위해 학생등록정보를 모두 날리게 되는 것이다.


> [참고] (https://yaboong.github.io/database/2018/03/09/database-normalization-1/)

## 무결성에 대해 말해보시오

**무결성이란**
- 데이터의 __정확성과 일관성을 유지하고 보증하는__ 것

**개체 무결성**
- 기본키로 설정된 컬럼은 고유한 값을 가지며 NULL허용X

**참조 무결성**
- 외래키 값은 NULL이거나 참조 릴레이션의 기본키 값과 동일해야 합니다.
- 즉 릴레이션은 참조할 수 없는 외래키 값을 가질 수 없습니다.
- 참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 갖도록 유지하는것

**도메인 무결성**
- 특정 속성의 값이 그 속성이 정의된 도메인에 속한 값이어야 한다는 규정
- ex) 주민등록번호에 알파벳입력되면 도메인 무결성 깨진것

**고유 무결성**
- 특정 속성에 대해 고유한 값을 가지도록 조건이 주어진 경우, 그 속성값은 모두 달라야 하는 제약조건을 말합니다.
- ex)학생 릴레이션(테이블)에서 테이블 정의시 '이름' 속성에는 중복된 값이 없도록 제한했다면, '이름' 속성에는 중복된 이름이 있어서는 안됩니다.

**NULL 무결성**
- 특정 속성값에 NULL 이 올 수 없다는 조건이 주어진 경우, 그 속성값은 NULL 값이 올 수 없다는 제약조건을 말합니다.

**키 무결성**
- 한 릴레이션(테이블)에는 최소한 하나의 키가 존재해야 한다는 제약조건을 뜻합니다.

> [참고](https://limkydev.tistory.com/161)

## 조인이 무엇인지?
- inner, left, right, outer
- 관련 있는 컬럼을 기준으로 행을 합쳐주는 연산
![SQL JOIN](https://user-images.githubusercontent.com/55946791/81374887-3fefce80-913b-11ea-99cd-366bfb6d7c7d.png)


## NoSQL이란? 기존 RDBMS와 다른점은?
- NoSQL = Not Only SQL or Non relational Database


**RDBMS**
- 데이터는 엄격한 스키마(데이터 개체, 속성, 관계,제약조건)에 따라 table에 저장된다
- 관계를 통해 연결된 여러개의 테이블에 저장
- 사용
	- __데이터 자주 수정되는 애플리케이션 일때_
	- __변경될 여지 없고, 명확한 스키마가 중요할경우__

- __장점__
	- 명확한 데이터 구조 보장 (정해진 스키마에 따라 데이터를 저장하기 때문에)
	- __데이터 중복을 피해,__ 공간 절약 (각 데이터에 맞게 테이블을 나눠서 저장하기 때문)
- __단점__
	- 관계로 인한 시스템 복잡도를 고려하여 구조화 해야한다
	- 시스템이 복잡하면, query문 복잡, 성능 저하
	- 수평적 확장 어려움, 대부분 수직적 확장, 한계에 직면할 수 있다

*NoSQL*
- 분산처리 목적으로 나옴
- 스키마X 관계X
- 테이블과 같은 개념으로 컬렉션이라는 형태로 데이터를 관리
- 사용
	- 정확한 데이터 구조 알 수 없거나 변경,확장 가능한 경우
	- __읽기가 많고, 변경이 적을때__
	- __막대한 양의 데이터 다룰때__ (수평적 확장 용이)
- __장점__
	- 테이블간의 복잡한 관계를 생각 안해도 된다.
	- 스키마가 없어서, 유연하다. 언제든지 저장데이터를 조정하고 새로운 필드 추가 가능
	- __자주 변경도지 않는 데이터를 저장하기 유리하다__
	- __수평적 확장에 용이__ ,(읽기, 쓰기가 빠르다)
- __단점__
	- __데이터 업데이트시, 중복될수__ 있어 저장 __데이터를 똑같이 관리__ 해줘야한다.(자유롭게 데이터 추가가능하여, 중복 저장될수있다)
- 종류 : MongoDB, HBASE, Cassandra등
>[참고](https://kimsangyeon.github.io/sql/nosql/database/2019/08/16/rdbms-nosql.html)


## 트랜잭션이란?(+트랜잭션의 성질)

- 의미 : (한 단위를 이루는) __일련의 연관된 DB조작__
- 데이터 __무결성__ 을 위해 가장 좋은 방법

**1. 원자성**
- 트랜잭션의 연산은 데이터베이스에 __모두 반영 or 전혀 반영되지 않아야 한다.__

**2. 일관성**
- 트랜잭션이 그 실행을 성공적으로 완료하면 언제나 일관성 있는 데이터베이스 상태로 변환한다.
- 시스템이 가지고 있는 __고정요소는 트랜잭션 수행 전과 트랜잭션 수행 완료 후의 상태가 같아야 한다.__

**3. 고립성**
- 둘 이상의 트랜잭션이 동시에 병행 실행되는 경우 어느 하나의 트랜잭션 실행중에 다른 트랜잭션의 연산이 끼어들 수 없다.
- __수행중인 트랜잭션은 완전히 완료될 때까지 다른 트랜잭션에서 수행 결과를 참조할 수 없다.__

**4. 영속성**
- 성공적으로 완료된 트랜잭션의 결과는 시스템이 고장나더라도 영구적으로 반영되어야 한다.
- 일단 커밋이 되면 트랜잭션에 의해 변경된 내용은 영구적이어야한다
- DB시스템은 DB의 현재 상태가 유실되지 않도록 시스템 충돌 등의 문제로부터 복구할 수 있는 방법을 갖춰야 한다.

> :arrow_double_up:[Top](#4-Database) :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#4-Database) :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 2단계 락킹이란?
- 데이터가 읽거나 쓰거나 락을 해야하는데
- 동시에 락을 걸수있기때문에 , 단계를 나눠서 생각해야한다
- 확장단계 - 락을 걸수있고
- 수축단계 - 언락
- 공유락, 배타락을 따로 두고 임의로 병행접근못하게한다
- 데드락 발생가능, 확장단계에서 수축단계를 기다릴수있기때문

> :arrow_double_up:[Top](#4-Database) :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#4-Database) :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 공유락, 배타락이란?
- 공유락 : 읽기만
- 배타락 : 읽기+쓰기
- 공유락이 걸려있을때 배타락이 허용가능한가요?
	- 공유락 일때 공유락은 가능. 배타락 불가능
	- 배타락일땐, 공유락 불가능. 배타락 불가능.

> :arrow_double_up:[Top](#4-Database) :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#4-Database) :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 색인이란? 색인을 사용했을때 장단점?
- DB에서 검색시, 테이블의 모든 데이터를 검색하면 시간이 오래걸린다
- 컬럼의 값 & 해당 레코드가 저장된 주소를 키&쌍 으로 index로 만들어 관리하는것

- 특징
	- 논리적/물리적으로 테이블과 독립적이다
- 장점 : 검색 시 빠르게 탐색
- 단점 : 새로운 값 추가, 삭제, 수정시 쿼리문 속도 느려진다(인덱스를 수정해야하기때문)

>[참고](https://lalwr.blogspot.com/2016/02/db-index.html)

> :arrow_double_up:[Top](#4-Database) :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#4-Database) :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 역정규화를 하는 이유는 무엇인가? (★★★)
- <https://scidb.tistory.com/entry/%EC%97%AD%EC%A0%95%EA%B7%9C%ED%99%94-%EB%AC%B4%EC%97%87%EC%9D%B4-%EB%AC%B8%EC%A0%9C%EC%9D%B8%EA%B0%80>
> :arrow_double_up:[Top](#4-Database) :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#4-Database) :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
