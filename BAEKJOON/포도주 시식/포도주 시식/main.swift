//
//  main.swift
//  포도주 시식
//
//  Created by 유현진 on 2023/05/17.
//

import Foundation

func solution() -> Int{
    let N = Int(readLine()!)!
    var list = [Int]()
    var dp = Array(repeating: 0, count: N)
    for _ in 0..<N{
        list.append(Int(readLine()!)!)
    }

    
    if N == 1{
        return list[0]
    }else if N == 2{
        return list[0] + list[1]
    }
    dp[0] = list[0]
    dp[1] = list[0] + list[1]
    dp[2] = max(dp[1], dp[0]+list[2], list[1]+list[2])
    for i in 3..<N{
        dp[i] = max(dp[i-2] + list[i], dp[i-3] + list[i-1] + list[i], dp[i-1])
    }
    return dp.last!
}

print(solution())
