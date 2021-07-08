/*
1. 한 번에 하나의 원판만 이동할 수 있다.
2. 맨 위에 있는 원판만 이동할 수 있다.
3. 크기가 작은 원판 위에 큰 원판이 쌓일 수 없다.
4. 중간의 막대를 임시적으로 이용할 수 있으나 앞의 조건들을 지켜야 한다.
*/

func hanoi(_ n: Int, _ from: Character, _ tmp: Character, _ to: Character){
    if n == 1{
        print("원판 1을 \(from)에서 \(to)로 옮긴다.")
    }
    else{
        hanoi(n-1, from, to, tmp)
        print("원판 \(n)을 \(from)에서 \(to)로 옮깁니다")
        hanoi(n-1, tmp, from, to) 
    }
}

hanoi(4, "A","B","C")
