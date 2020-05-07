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

---

### quick sort

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

### insertion sort
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

### DFS와 BFS의 차이

**DFS : 깊이 우선 탐색**
- 단순 검색속도는 BFS보다 느리다
- 자기 자신을 호출하는 순환 알고리즘의 형태

**BFS : 너비우선탐색**
- 큐나 인접리스트로 구현

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 이분 탐색 알고리즘

- 과정

```
정렬된 배열에서 특정값을 찾아내는 알고리즘이다.
배열의 중간에 있는 임의의 값을 선택해서 찾고자 하는 값과 비교한다.
찾고자 하는 값보다 작으면 중간값을 기준으로 좌측데이터를 값보다 크면 우측 대이터를 다시 탐색한다
동일한 방법으로 다시 중간값을 임의로 선택하고 비교한다.
```

- 시간 복잡도 : O(logN) , 중간값을 기준으로 계속 반으로 나누므로

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### 알고있는 정렬 알고리즘과 좋아하는 정렬알고리즘

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

### 두개의 stack을 이용해 queue를 구현하라

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

### LinkedList의 원소를 역순으로 출력하는 방법은?

> [참고](https://hyerios.tistory.com/47)

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### tree와 graph를 설명하라

**트리와 그래프 차이**
![graph-vs-tree](https://user-images.githubusercontent.com/55946791/81316131-27919c80-90c6-11ea-9c27-c4b22eb67e10.png)



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

### 해싱의 충돌을 해결하는 방법들을 설명하라

> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)

### huffman encoding에 대해 설명하라
> :arrow_double_up:[Top](#6-algorithm)    :leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#6-algorithm)    :information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)
