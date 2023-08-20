//
//  main.swift
//  멀리 뛰기
//
//  Created by 유현진 on 2023/08/21.
//

import Foundation

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+1)
    for i in 1..<dp.count{
        if i == 1{
            dp[i] = 1
        }else if i == 2 {
            dp[i] = 2
        }else{
            dp[i] = (dp[i-1] + dp[i-2]) % 1234567
        }
    }
    return dp[n]
}

print(solution(4))
print(solution(3))

print(solution(2000))
