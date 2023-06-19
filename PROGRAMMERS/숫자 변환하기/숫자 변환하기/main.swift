//
//  main.swift
//  숫자 변환하기
//
//  Created by 유현진 on 2023/06/16.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    if x == y {
         return 0
    }
    
    var dp = Array(repeating: -1, count: 1000001)
    dp[x] = 0
    
    for i in x...y{
        if dp[i] == -1 {
            continue
        }
        if i + n <= y{
            dp[i+n] = dp[i+n] == -1 ? dp[i] + 1 : min(dp[i] + 1, dp[i+n])
        }
        if i * 2 <= y{
            dp[i*2] = dp[i*2] == -1 ? dp[i] + 1 : min(dp[i] + 1, dp[i*2])
        }
        if i * 3 <= y{
            dp[i*3] = dp[i*3] == -1 ? dp[i] + 1 : min(dp[i] + 1, dp[i*3])
        }
    }
    return dp[y]
}
print(solution(10, 40, 5))
print(solution(10, 40, 30))
print(solution(2, 5, 4))
