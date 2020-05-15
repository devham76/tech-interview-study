#! /bin/bash

########################
## 과목별로 실행 해준다
########################

function solution(){

# 1. 목록에 * 달아 주기
i=0
for list in "${lists[@]}"; do
	if [ $i -ne "0" ]
	then
		echo "* $list"
	fi
	i=$((i+1))
done

echo " "
# 2. * 제목 입니다(#제목-입니다) ; 형태로 만들기
i=0
answer=""
for list in "${lists[@]}"; do
	# 공백 정확히 입력해야 if문 오류안난다
	if [ $i -ne "0" ]
	then
		# tr은 치환한것을 echo만 해줄뿐, 치환한것을 변수에 저장 못한다
		# 따라서 echo한것을 answer에 입력
		answer=$(echo "(#$list)" | tr ' ' '-')
		echo "* [$list]${answer}"
	fi
	i=$((i+1))
done

echo ""

# 3. ### & 태그 달아주기

type=${lists[0]}

tag="> :arrow_double_up:[Top](#${type})
:leftwards_arrow_with_hook:[Back](https://github.com/devham76/tech-interview-studyw#${type})
:information_source:[Home](https://github.com/devham76/tech-intervie-studyw#tech-interview)"


i=0
for list in "${lists[@]}"; do
	if [ $i -ne "0" ]
	then
		echo "## $list"
		echo $tag
		# echo -e $tag # 줄바꿈 필요하면 사용
		echo ""
	fi
	i=$((i+1))
done

echo ""
echo "-------------------------------------"
echo ""
}

########################
## 1. 파일 돌면서 공백이 나오기 전까지 실행
########################

# 1. file.txt 파일에 있는 목록 읽기
Lists=()
i=0
while read LINE; do
	# 해당 줄이 공백이 아니면 계속 읽는다
	if [ -z "$LINE" ];
	then
		echo "빈값"
		solution $Lists[@]
		Lists=()
		i=0
	else
        	# 공백 포함시, 따옴표 필수
		Lists[$i]="$LINE"
		echo "$Lists[0]"

        	i=$((i+1))
	fi

done < file.txt
