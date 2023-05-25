//
//  main.swift
//  RGB거리
//
//  Created by 유현진 on 2023/05/08.
//

import Foundation

func solution(){
    // red, green, blue
    let N = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
    var map = [[0,0,0]]
    for _ in 0..<N{
        map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    for i in 1...N{
        dp[i][0] = map[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = map[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = map[i][2] + min(dp[i-1][1], dp[i-1][0])
    }
    print(dp[N].min()!)
}

solution()
