# 6. Algorithm
**:book: Contents**

* [quick sort가 일어나는 과정을 설명해주세요](#quick-sort)

* [insertion sort가 일어나는 과정을 설명해주세요](#insertion-sort)

* [DFS와 BFS의 차이를 말해주세요](#DFS와-BFS의-차이)

* [이분 탐색 알고리즘에 대해 설명해주세요](#이분-탐색-알고리즘)

* [알고있는 정렬 알고리즘과 그 중 좋아하는 정렬알고리즘 설명해주세요](#알고있는-정렬-알고리즘과-좋아하는-정렬알고리즘)

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


### DFS와 BFS의 차이

**DFS : 깊이 우선 탐색**
- 단순 검색속도는 BFS보다 느리다
- 자기 자신을 호출하는 순환 알고리즘의 형태

**BFA 너비우선탐색**
- 큐나 인접리스트로 구현

### 이분 탐색 알고리즘

- 과정

```
정렬된 배열에서 특정값을 찾아내는 알고리즘이다.
배열의 중간에 있는 임의의 값을 선택해서 찾고자 하는 값과 비교한다.
찾고자 하는 값보다 작으면 중간값을 기준으로 좌측데이터를 값보다 크면 우측 대이터를 다시 탐색한다
동일한 방법으로 다시 중간값을 임의로 선택하고 비교한다.
```

- 시간 복잡도 : O(logN) , 중간값을 기준으로 계속 반으로 나누므로

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
