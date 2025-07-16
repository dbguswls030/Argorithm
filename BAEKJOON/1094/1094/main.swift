// 64cm 막대
// 가지고 있는 막대의 길이를 모두 더함
// 이때 합이 X보다 크다면
// 1. 가지고 있는 막대 중 길이가 가장 짧은 것을 절반으로 자름
// 2. 위에서 자른 막대의 절반 중 하나를 버리고 남아있는 막대의 길이의 합이 X보다 크거나 같다면 위에서 자른 ㅏㅁㄱ대의 절반 중 하나를 버린다.
// 남아있는 모든 막대를 붙인다.

import Foundation

//func solution() {
//    let X = Int(String(readLine()!))!
//    print(X.nonzeroBitCount)
//}

func solution() {
    var X = Int(String(readLine()!))!
    var count = 0

    while X > 0 {
        if (X & 1) == 1 {
            count += 1
        }
        X >>= 1
    }
    print(count)
}

solution()
