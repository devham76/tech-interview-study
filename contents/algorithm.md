# 6. Algorithm
**:book: Contents**

* [quick sort가 일어나는 과정을 설명해주세요](#quick-sort)

* [insertion sort가 일어나는 과정을 설명해주세요](#insertion-sort)

* [DFS와 BFS의 차이를 말해주세요](#DFS와-BFS의-차이)

* [이분 탐색 알고리즘에 대해 설명해주세요](#이분-탐색-알고리즘)

* [알고있는 정렬 알고리즘과 그 중 좋아하는 정렬알고리즘 설명해주세요](#알고있는-정렬-알고리즘과-좋아하는-정렬알고리즘)


* [두개의 stack을 이용해 queue를 구현하라](#두개의-stack을-이용해-queue를-구현하라)						
* [LinkedList의 원소를 역순으로 출력하는 방법은?](#LinkedList의-원소를-역순으로-출력하는-방법은?)
* [tree와 graph를 설명하라](#tree와-graph를-설명하라)
* [해싱의 충돌을 해결하는 방법들을 설명하라](#해싱의-충돌을-해결하는-방법들을-설명하라)
* [huffman encoding에 대해 설명하라](#huffman-encoding에-대해-설명하라)

* [벨만포드 알고리즘과 다익스트라 알고리즘의 차이점?](#벨만포드-알고리즘과-다익스트라-알고리즘의-차이점?)
* [MST 알고리즘(Spanning Tree란?)](#MST-알고리즘(Spanning-Tree란?))
* [프림](#프림)
* [크루스칼](#크루스칼)
* [Floyd-Warshall 알고리즘](#Floyd-Warshall-알고리즘)


---

* [프라이어리티 큐의 구조 설명](#프라이어리티-큐의-구조-설명)
* [heap에서 delete 과정을 그려라](#heap에서-delete-과정을-그려라)
* [16진수 수를 10진수로 변경하는 코드를 작성해보세요](#16진수-수를-10진수로-변경하는-코드를-작성해보세요)
* [이진트리, 이진 검색트리, 힙이 각각 무엇인지 설명해주세요](#이진트리,-이진-검색트리,-힙이-각각-무엇인지-설명해주세요)
* [해시테이블과 이진 검색트리를 비교하고 장단점을 이야기해주세요](#해시테이블과-이진-검색트리를-비교하고-장단점을-이야기해주세요)
* [메모리가 제한된 모바일 기기용 주소록에 사용할 자료구조를 설계한다면 어느쪽을 쓰는것이 좋을까요?](#메모리가-제한된-모바일-기기용-주소록에-사용할-자료구조를-설계한다면-어느쪽을-쓰는것이-좋을까요?)
* [LinkedList와 ArrayList의 차이](#LinkedList와-ArrayList의-차이)
---
---

## quick sort

**정렬 과정**
- (1)피벗을 기준으로 왼쪽에는 피벗보다 작은 수를, 오른쪽에는 피벗보다 큰 수를 놓는다.
- (2)피벗을 기준으로 나뉜 두배열에서 각각 피벗을 정해서 (1)과 같이 정리한다.
- 더이상 나눌수없을때까지 나눠서 정렬한다.

**장단점**
- 장점 : 속도가 빠르다 , 추가 메모리 공간을 필요로 하지 않는다
- 단점 : 정렬된 리스트에 대해서는 퀵 정렬의 불균형 분할에 의해 오히려 수행시간이 더 많이 걸린다(따라서 피벗을 중간값으로 잡는것이 좋다.)
- 신뢰성이 낮다. pivot에 따라 시간복잡도가 크게 달라지고, 최악의 경우 O(N2)이 나온다.
- 따라서 안정적인 시간복잡도를 요구하는 곳(db쿼리 결과생성 등)에서 사용x
- 불안정한 정렬이다. 중복되는 key값에 대해 순서대로 정렬되지 않는다.

```java
public static int partition(int arr[], int left, int right) {

	int pivot = arr[(left + right) / 2];

	while (left < right) {
		while ((arr[left] < pivot) && (left < right))
			left++;
		while ((arr[right] > pivot) && (left < right))
			right--;

		if (left < right) {
			int temp = arr[left];
			arr[left] = arr[right];
			arr[right] = temp;
		}
	}

	return left;
}

public static void quickSort(int arr[], int left, int right) {

	if (left < right) {
		int pivotNewIndex = partition(arr, left, right);

		quickSort(arr, left, pivotNewIndex - 1);
		quickSort(arr, pivotNewIndex + 1, right);
	}

}

```
> [참고](https://creatordev.tistory.com/7)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## insertion sort
- 모든 요소들을 차례로 이미 정렬된 배열 부분과 비교해서, 자신의 위치를 찾아 삽입하면서 정렬

```java
public class InsertionSort {

	public static void main(String[] args) {

		int [] arr = {10, 2, 6, 4, 3, 7, 5};

		for (int i = 1; i < arr.length; i++) {
			int standard = arr[i];  // 기준
			int aux = i - 1;   // 비교할 대상

			while (aux >= 0 && standard < arr[aux]) {
				arr[aux + 1] = arr[aux];   // 비교대상이 큰 경우 오른쪽으로 밀어냄
				aux--;
			}
			arr[aux + 1] = standard;  // 기준값 저장
		}
		printArr(arr);
	}

	public static void printArr(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
	}
}

```

> - [참고1](https://gmlwjd9405.github.io/2018/05/06/algorithm-insertion-sort.html)
> - [참고2](https://marobiana.tistory.com/85)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## DFS와 BFS의 차이

**DFS : 깊이 우선 탐색**
- 단순 검색속도는 BFS보다 느리다
- 자기 자신을 호출하는 순환 알고리즘의 형태

**BFS : 너비우선탐색**
- 큐나 인접리스트로 구현

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 이분 탐색 알고리즘

- 과정

```
정렬된 배열에서 특정값을 찾아내는 알고리즘이다.
배열의 중간에 있는 임의의 값을 선택해서 찾고자 하는 값과 비교한다.
찾고자 하는 값보다 작으면 중간값을 기준으로 좌측데이터를 값보다 크면 우측 대이터를 다시 탐색한다
동일한 방법으로 다시 중간값을 임의로 선택하고 비교한다.
```

- 시간 복잡도 : O(logN) , 중간값을 기준으로 계속 반으로 나누므로

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 알고있는 정렬 알고리즘과 좋아하는 정렬알고리즘

![정렬알고리즘](https://user-images.githubusercontent.com/55946791/81137452-d6848a00-8f99-11ea-90da-1b55ed10c83c.JPG)

- 상황에 따라 다르다. 어떤 알고리즘이 최선이라고 할수 없다.


**퀵, 힙, 병합**
1. 퀵 정렬(Quick sort)
- 장점:
  - 분할과정에서 logN, partition에서 N시간이 걸려 평균적으로 O(NlogN) 으로 빠르게 정렬된다.
  - 최선의 성능을 낼 때는 병합정렬, 힙정렬보다 빠르다.

- 단점:
  - 신뢰성이 낮다. 기준값(pivot)에 따라 시간복잡도가 크게 달라지고, 최악의 경우 O(N2)이 나온다. 고로, 안정적인 시간복잡도를 요구하는 곳(사용자에게 데이터베이스 쿼리 결과생성 등)에서 사용할 수 없다.
  - unstable 정렬이다. 중복되는 key값에 대해 순서대로 정렬되지 않는다.

2. 병합 정렬
- 장점:
  - 안정적으로 준수한 시간 내에 정렬한다. O(NlogN) 시간 복잡도이다. 이는 매우 큰 장점이다.
  - stable 정렬이다.
- 단점:
  - 추가적인 메모리가 필요하다. 임시배열 temp[]에 원본 배열의 복사가 필요하다. 배열의 크기가 상당히 큰 경우 부담이 될 수도 있다.

3. 힙 정렬
- 장점:
  - 추가적인 메모리를 필요로 하지 않으면서, 최악의 경우에도 O(NlogN)을 보장한다.
- 단점:
  - 데이터에 분포에 따라 결과가 다르게 나오는, 불안정성이 있다.
  - unstable 정렬이다.
> [참고](https://wordbe.tistory.com/entry/Sort-%EB%8C%80%ED%91%9C%EC%A0%81%EC%9D%B8-%EC%A0%95%EB%A0%AC%EC%9D%98-%EB%AA%A8%EB%93%A0-%EA%B2%83)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 두개의 stack을 이용해 queue를 구현하라

![stack 으로 queue](https://user-images.githubusercontent.com/55946791/81314079-a6d1a100-90c3-11ea-9a2d-f356150f14ee.jpg)

```java
public static void main(String[] args) {
	Queue<Integer> q = new LinkedList<>();
	Stack<Integer> s = new Stack();

	Stack<Integer> s1 = new Stack();
	Stack<Integer> s2 = new Stack();

	for(int i=1; i<4; i++) {
		q.add(i);
		s.push(i);

		s1.push(i);
	}

	System.out.println("큐 출력값");
	while(!q.isEmpty()) {
		System.out.println(q.poll());
	}
	System.out.println("스택 출력값");
	while(!s.isEmpty()) {
		System.out.println(s.pop());
	}

	//------------------------
	while(!s1.isEmpty()) {
		int num = s1.pop();
		s2.push(num);
	}
	System.out.println("스택2 출력값");
	while(!s2.isEmpty()) {
		System.out.println(s2.pop());
	}
```

> [참고](https://pro-programmer.tistory.com/entry/%EB%91%90%EA%B0%9C%EC%9D%98-%EC%8A%A4%ED%83%9DStack%EC%9C%BC%EB%A1%9C-%ED%81%90Queue-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## LinkedList의 원소를 역순으로 출력하는 방법은?
- 1. 스택으로 구현
- 2. 다른 링크드리스트로 구현(null객체)

> [참고](https://hyerios.tistory.com/47)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## tree와 graph를 설명하라

**트리와 그래프 차이**
![graph-vs-tree](https://user-images.githubusercontent.com/55946791/81316131-27919c80-90c6-11ea-9c27-c4b22eb67e10.png)

-
트리와 그래프를 언제 사용할수있을까요?

**트리**
![tree-terms](https://user-images.githubusercontent.com/55946791/81315154-e51b9000-90c4-11ea-9110-fef627fcd7c8.png)

- 노드로이루어진 자료 구조
- 트리는 계층 모델 이다.
- node와 edge로 구성
- 트리에는 cycle이 존재x
<br>
- 트리의 구성
```
1. 하나의 루트 노드를 갖는다
2. 루트 노드는 0개 이상의 자식 노드를 갖는다.
3. 그 자식의 노드 또한 0개 이상의 자식을 갖고 이 구조가 반복된다.
```
<br>

- 트리의 종류
		- 이진 트리, 이진 탐색 트리, 균형 트리(AVL 트리, red-black 트리), 이진 힙(최대힙, 최소힙)
- 트리의 탐색
	- 중위 순회(in-order traversal): 왼쪽 가지 -> _현재 노드_ -> 오른쪽 가지
	- 전위 순회(pre-order traversal): _현재 노드_ -> 왼쪽 가지 -> 오른쪽 가지
	- 후위 순회(post-order traversal): 왼쪽 가지 -> 오른쪽 가지 -> _현재 노드_
- 트리의 구현 : 배열과 연결리스트 모두 사용하여 구현이 가능

> [참고](https://gmlwjd9405.github.io/2018/08/12/data-structure-tree.html)

**그래프**
- 노드와 그 노드를 연결하는 간선을 모아 놓은 자료구조
- 연결되어 있는 객체 간의 __관계__ 를 표현할 수 있는 자료구조

**그래프 특징**
- 네트워크 모델
- 루트 노드라는 개념x
- 부모-자식 관계 개념x
- 순환 혹은 비순환이다
- 방향 그래프와 무방햔 그래프가 있다.

**그래프 구현**
- 인접리스트 , 인접행렬로 구현가능

**그래프의 탐색**
- 깊이 우선 탐색(DFS, Depth-First Search)
루트 노드(혹은 다른 임의의 노드)에서 시작해서 다음 분기(branch)로 넘어가기 전에 해당 분기를 완벽하게 탐색하는 방법
	- 즉, 넓게(wide) 탐색하기 전에 깊게(deep) 탐색하는 것이다.
	- 사용하는 경우: 모든 노드를 방문 하고자 하는 경우에 이 방법을 선택한다.
	- 깊이 우선 탐색이 너비 우선 탐색보다 좀 더 간단하다.
- 너비 우선 탐색(BFS, Breadth-First Search)
루트 노드(혹은 다른 임의의 노드)에서 시작해서 인접한 노드를 먼저 탐색하는 방법
	- 즉, 깊게(deep) 탐색하기 전에 넓게(wide) 탐색하는 것이다.
	- 사용하는 경우: 두 노드 사이의 최단 경로 혹은 임의의 경로를 찾고 싶을 때 이 방법을 선택한다.
		- Ex) 지구상에 존재하는 모든 친구 관계를 그래프로 표현한 후 Ash와 Vanessa 사이에 존재하는 경로를 찾는 경우
		- 깊이 우선 탐색의 경우 - 모든 친구 관계를 다 살펴봐야 할지도 모른다.
		- 너비 우선 탐색의 경우 - Ash와 가까운 관계부터 탐색


> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 해싱의 충돌을 해결하는 방법들을 설명하라


**체이닝**
![체이닝](https://user-images.githubusercontent.com/55946791/81363693-eb3e5a80-911e-11ea-887d-b2a66844f30b.png)

- 같은 주소로 해슁되는 원소를 모두 하나의 __연결 리스트__ 에 매달아 관리한다
- 체이닝에서 삽입은 효율성을 위해 연결리스트의 _맨 앞에 삽입_ 한다.
	- 맨 뒤에 삽입할 경우 삽입시마다 연결리스트를 따라 맨 끝으로 이동해야 하므로 낭비가 된다

- 탐색과 삭제를 하려면 원하는 데이터를 찾기 위해 순차 탐색해야한다.

**개방주소(open address)**
- 체이닝과 같이 __추가 공간을 허용하지 않고__ 주어진 해쉬 테이블 공간 내에서 해결한다
- 해쉬 함수를 계산해서 계산된 주소를 차지하고 있는 다른 원소가 없으면 그 자리에 넣고
- 다른 원소가 있으면 __정해진 규칙__ 에 따라 다음 자리를 찾게 된다.
- 정해진 규칙, 즉 다음 주소를 결정하는 방법은 3가지 이다. : __선형조사, 이차원 조사, 더블해슁__

**개방주소 - 선형 조사**
![개방주소 선형조사](https://user-images.githubusercontent.com/55946791/81364514-c5b25080-9120-11ea-8c50-9e27442cfbb2.png)
- 가장 간단한 충돌 해결방법
- 충돌이 일어나면 바로 뒷자리를 확인해서 비어있는 경우 저장한다.
- 단점 : 특정 영역에 원소가 몰리면 성능이떨어진다. (검색시간, 삽입시간 저하) __1차군집화__


**개방주소 - 제곱 탐색(Quadratic Probing)**
![개방주소 이차원 조사](https://user-images.githubusercontent.com/55946791/81364513-c519ba00-9120-11ea-8299-04cbb87d950e.png)
- 이차원 조사는 바로 뒷자리를 보는 선형 조사와 달리 __보폭을 이차함수에 의해 넓혀가면서__ 본다.
	- ex) i번째 해쉬 함수를 h(x)로 부터 i^2만큼 떨어진 자리로 삼을 수 있다.
	- ex) h(x), h(x)+1, h(x)+4, h(x)+9, h(x)+16...
- 해시충돌 시 제곱만큼 건너뛴 버켓에 데이터를 삽입(1,4,9,16..)
- 장점 : 선형 조사에서처럼 특정 영역에 원소가 몰려도 그 영역을 빨리 벗어날수있다.
- 단점 : __2차 군집화__ 문제발생

**개방주소 - 더블 해싱**
- 2개의 해시함수를 사용해서, 충돌 발생시 다른 해시함수로 해시값을 만들어 원소를 저장한다.
- 해시충돌 시 다른 해시함수를 한 번 더 적용한 결과를 이용함.

- 장점 : 군집화 해결

> [참고 - 더블해싱](https://m.blog.naver.com/beaqon/221300416700)

> [참고 - 해시 충돌](https://itstory.tk/entry/%ED%95%B4%EC%8A%81%EC%97%90%EC%84%9C%EC%9D%98-%EC%B6%A9%EB%8F%99%ED%95%B4%EA%B2%B0Collision-Resolution)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## huffman encoding에 대해 설명하라

> [참고](http://www.judgeon.net/problem.php?id=3022)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


## 벨만포드 알고리즘과 다익스트라 알고리즘의 차이점?


다익스트라 - 우선순위큐
벨만코드 - 구현어떻게하는지

- 최단 경로 : 주어진 두 노드 사이의 경로들 중에서 __최소 비용인 경로__ 를 찾는 것

**다익스트라**
- 하나의 정점, 다른 모든 정점으로의 최단경로

- 다익스트라 알고리즘은 다음과 같다. (P[A][B]는 A와 B 사이의 거리라고 가정한다)

1. 출발점으로부터의 최단거리를 저장할 배열 d[v]를 만들고, 출발 노드에는 0을, 출발점을 제외한 다른 노드들에는 매우 큰 값 INF를 채워 넣는다. (정말 무한이 아닌, 무한으로 간주될 수 있는 값을 의미한다.) 보통은 최단거리 저장 배열의 이론상 최대값에 맞게 INF를 정한다. 실무에서는 보통 d의 원소 타입에 대한 최대값으로 설정하는 편. [5][6]
2. 현재 노드를 나타내는 변수 A에 출발 노드의 번호를 저장한다.
3. A로부터 갈 수 있는 임의의 노드 B에 대해, d[A] + P[A][B][7]와 d[B][8]의 값을 비교한다. INF와 비교할 경우 무조건 전자가 작다.
4. 만약 d[A] + P[A][B]의 값이 더 작다면, 즉 더 짧은 경로라면, d[B]의 값을 이 값으로 갱신시킨다.
5. A의 모든 이웃 노드 B에 대해 이 작업을 수행한다.
6. A의 상태를 "방문 완료"로 바꾼다. 그러면 이제 더 이상 A는 사용하지 않는다.
7. "미방문" 상태인 모든 노드들 중, 출발점으로부터의 거리가 제일 짧은 노드 하나를 골라서 그 노드를 A에 저장한다.
8. 도착 노드가 "방문 완료" 상태가 되거나, 혹은 더 이상 미방문 상태의 노드를 선택할 수 없을 때까지, 3~7의 과정을 반복한다.

- 이 작업을 마친 뒤, 도착 노드에 저장된 값이 바로 A로부터의 최단 거리이다. 만약 이 값이 INF라면, 중간에 길이 끊긴 것임을 의미한다.

> [참고](https://namu.wiki/w/%EB%8B%A4%EC%9D%B5%EC%8A%A4%ED%8A%B8%EB%9D%BC%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98)
> [코드 확인하기](https://devham76.github.io/datastructure/data_struture-Dijkstra/)

**벨만 포드**
- dp 관점
- 다익스트라보다 느리다

| 다익스트라| 벨만 포드|
|--|--|
|greedy 관점| dp관점|
|벨만 포드 보다 빠르다 | 모든 수를 고려하기 때문에 다익스트라 보다 느리다|
|그래프에 음의 가중치를 가진 간선x|그래프에 음의 가중치를 가진 간선o|

>[참고](http://blog.naver.com/PostView.nhn?blogId=qbxlvnf11&logNo=221377612306&categoryNo=21&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postView)


## MST 알고리즘(Spanning Tree란?)

- 언제 사용하나요 ?
	- 통신구축


**Spanning Tree**
- 그래프 내의 모든 정점을 포함하고 일부 간선을 선택해서 만든 트리
- 사이클 포함 x
- 하나의 크래프에서 많은 신장 트리 존재할수있다

**MST(Minimum Spanning Tree)**
- 최소 신장 트리
- 그래프에 있는 __모든 정점들을 가장 적은 수의 간선과 비용으로 연결__

- 정점 n개이면, 간선은 n-1개

- MST는 최단거리가 아닐 수 있다. (최단 경로는 다익스트라)

**MST 종류**
- Kruskal , Prim

>[참고](https://devham76.github.io/algorithm/mst/)

## 프림
![prim mst](https://user-images.githubusercontent.com/55946791/81514716-9ba09e80-936b-11ea-90da-ba7578715bcc.png)

- __시작 정점에서부터 출발__ 하여 신장 트리 집합을 단계적으로 확장해나가는 방법
- 정점에 연결 된 간선의 가중치 중 __가장 작은 가중치의 간선을 연결해__ 나가는 방식
- __그래프에 간선이 많이 존재 하는 ‘밀집 그래프’의 경우 적합__


- 시간 복잡도 :

- 구현코드 ?

## 크루스칼

![kruskal mst](https://user-images.githubusercontent.com/55946791/81514711-92afcd00-936b-11ea-8b39-23449e496f7e.png)

1. 그래프의 간선들을 가중치의 오름차순으로 정렬 한다
2. 정렬된 간선 리스트에서 순서대로 사이클을 형성하지 않는 간선을 선택한다.
	- 즉, 가장 낮은 가중치를 먼저 선택

- kruskal : 그래프에 간선이 적게 존재 하는 __'희소 그래프'__ 의 경우 적합


- 시간복잡도 :

- 구현 코드 ?

## Floyd-Warshall 알고리즘
- 모든 정점에서 모든 정점으로 최단 경로
- 거쳐가는 정점을 기준으로 최단 거리를 구한다
	- 다익스트라 - 가장 적은 비용을 하나씩 선택


## Floyd-Warshall 알고리즘
- 모든 정점 에서 모든 정점으로 최단 경로
- 거쳐가는 정점을 기준으로 최단 거리를 구한다
	- 다익스트라 - 가장 적은 비용을 하나씩 선택

- https://blog.naver.com/ndb796/221234427842


## 프라이어리티 큐의 구조 설명
- 들어간 순서에 상관없이 우선순위가 높은 데이터가 먼저 나온다
- 구현 방법
	- 배열
	- 연결리스트
	- 힙
<br>
1. 배열
- 데이터 삽입, 삭제 과정이 비효율적이다.
- 삽입 위치를 찾기 위해 배열에 저장된 모든 데이터와 우선순위를 비교해야한다

2. 연결리스트
- 삽입 위치를 찾기 위해 배열에 저장된 모든 데이터와 우선순위를 비교해야한다

3. 힙
- 배열과 연결리스트의 단점 때문에 주로 힙으로 구현한다


> :arrow_double_up:[Top](#6-algorithm)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## heap에서 delete 과정을 그려라
- __삽입, 가장 마지막에 삽입 / 삭제, 루트 노드 삭제__


**힙**
- __완진이진트리 + 이진탐색트리의 형태__
- 최대힙(부모노드>자식노드) / 최소힙(부모노드<자식노드)
- 최댓값, 최솟값을 쉽게 추출할 수 있는 자료구조

 **삭제**	logN
 - __루트만 삭제 가능 , 삭제후 마지막 노드를 루트로 두고 우선순위비교__

 1. 루트노드를 삭제
 2. 가장 마지막 원소를 루트 노드의 위치로 옮겨준다.
 3. 자식노드와 우선순위를 비교해서 자신의 자리를 찾는다.


![힙 삭제](https://user-images.githubusercontent.com/55946791/81799451-525b7500-954c-11ea-93a0-fa92dab7657e.JPG)

**삽입** 마지막 노드에 삽입 logN
![힙 삽입](https://user-images.githubusercontent.com/55946791/81799454-538ca200-954c-11ea-9190-7883f0f5f8cc.JPG)


> [참고1](https://hannom.tistory.com/36)
> [참고2](https://gmlwjd9405.github.io/2018/05/10/data-structure-heap.html)

> :arrow_double_up:[Top](#6-algorithm)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 16진수 수를 10진수로 변경하는 코드를 작성해보세요
> :arrow_double_up:[Top](#6-algorithm)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


## 이진트리, 이진 검색트리, 힙이 각각 무엇인지 설명해주세요

**이진트리 (Binary Tree)**
![이진트리](https://user-images.githubusercontent.com/55946791/81796516-7fa62400-9548-11ea-9647-f73733c9842e.JPG)
- 노드의 최대 차수가 2인 트리

<br>
1. 편향 이진트리
	- 한 쪽으로 편향

![편향이진트리](https://user-images.githubusercontent.com/55946791/81798033-7f0e8d00-954a-11ea-86a5-d4ae54159be9.JPG)

2. 포화 이진트리
	- 이진트리에서 최대 노드의 수를 만족
![포화이진트리](https://user-images.githubusercontent.com/55946791/81796651-b2e8b300-9548-11ea-8193-fcdc96d86453.JPG)

3. 완전 이진트리 -> __힙__ (형태만)
	- 위에서 아래로, 왼쪽에서 오른쪽으로 __순서대로 채워진 트리__

![완전이진트리](https://user-images.githubusercontent.com/55946791/81799024-b16cba00-954b-11ea-9d41-34c1c6e12905.JPG)


**이진트리 vs 이진탐색 트리**

- 이진트리 : 노드의 최대차수가 2인 트리
<br>
- 이진탐색 : 정렬된 숫자에서 검색시, 한 숫자 선택, 검색 숫자보다 작으면 오른쪽, 크면 왼쪽 검사
- 이진탐색트리 : 이진트리 + 조건  
	- __조건 : 루트노드 > 왼쪽 자식 노드 && 루트노드 < 오른쪽 자식 노드__
	- 트리가 이진탐색을 한다
	- __완전 이진트리가 아닐수있다__
	- __탐색 방법__ : 전위, 중위, 후위 검색 방법이 있다

### 문제점 : 삽입,삭제를 하다보면 편향이진트리가 될수도있다.
- 삽입,삭제,검색 최악 : O(N) / 평균 : O(logN)

**이진탐색 트리**
- 이진탐색트리 검색
![이진탐색트리 검색](https://user-images.githubusercontent.com/55946791/81798464-0b20b480-954b-11ea-9741-5e49fe464b29.png)

- 이진탐색 삭제

```
지우려는 노드에
1. 자식이 없을 때
	- 부모와 연결해제
2. 자식이 하나만 있을 때
	- 자식과 그의 부모노드를 이어준다
3. 자식이 두개 다 있을 때
	- 왼쪽 자식 노드들 중에 가장 큰값 또는
	오른쪽 자식 노드들 중에 가장 작은값으로 교체
```

> [참고](https://zeddios.tistory.com/492)

- 자식 하나일떄
![이진탐색트리 삭제-자식하나](https://user-images.githubusercontent.com/55946791/81800767-512b4780-954e-11ea-90dd-347264164e1d.JPG)

- 자식 두개일떄
![이진탐색트리 삭제](https://user-images.githubusercontent.com/55946791/81798461-09ef8780-954b-11ea-9c54-d05f897b91cb.png)

> [참고](https://galid1.tistory.com/176?category=746456)

> :arrow_double_up:[Top](#6-algorithm)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

## 해시테이블과 이진 검색트리를 비교하고 장단점을 이야기해주세요. 그리고 메모리가 제한된 모바일 기기용 주소록에 사용할 자료구조를 설계한다면 어느쪽을 쓰는것이 좋을까요?

|비교|해시테이블|이진검색트리|
|--|--|--|
|시간복잡도 평균|key,value 충돌 없을때 O(1)| O(logN)|
|시간복잡도 최악 - 선형으로 검색|O(N)|O(N)|
|정렬| x| o|

- 해시테이블이 이진검색트리보다 빠르다
- 하지만, 정렬이 되지않아 정렬을 위한 메모리를 추가로 필요하다
- 따라서 이진검색트리가 해시테이블 보다는 느리지만 O(logN) 의 속도도 충분히 빠르기 때문에 메모리가 제한된 모바일 기기에서는 더 적절하다.
- 해시트리 ; 해시테이블때문에, 메모리가 추가로 필요할수있다.
- 해시트리 ; 충돌이 많이 일어나면 , 성능이 낮아진다

> :arrow_double_up:[Top](#6-algorithm)
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)


## LinkedList와 ArrayList의 차이
- ArrayList는 검색에 유리한 구조
- 삽입 삭제가 자주 일어나면 LinkedList를 사용하는것이 좋다.

- 이유 : ArrayList는 내부적으로 데이터를 배열에서 관리하며 데이터의 추가, 삭제를 위해 아래와 같이 __임시 배열을 생성해 데이터를 복사 하는 방법을__ 사용 하고 있기 때문에 삽입 삭제시 많은 복사가 일어나기 때문.


> :arrow_double_up:[Top](#6-algorithm) :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm) :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
