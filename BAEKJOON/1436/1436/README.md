# 1436 - 영화감독 숌
브루트포스
1씩 증가하는 정수 num에 대해 contains 메소드를 사용하여 666의 포함 여부를 체크하면 시간초과로 실패한다.
num % 10 == 6 을 반복하여 자릿수를 하나씩 검사할 때 연속으로 6이 3번 나올 경우에 대해서 count를 증가시키도록 구현해야 정답으로 인정되는 것 같다.
구글링에서 타 언어들은 contains 언어 사용해서 풀던데 swift는 안 된다.
