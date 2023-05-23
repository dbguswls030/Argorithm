//
//  main.swift
//  2xn 타일링
//
//  Created by 유현진 on 2023/05/23.
//

import Foundation

func solution() -> Int{
    var result = 0
    
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n + 1)
    if n == 1{
        return 1
    }else if n == 2{
        return 2
    }
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...n{
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
    
    return dp[n]
}
print(solution())
