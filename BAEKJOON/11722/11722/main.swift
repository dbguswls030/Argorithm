//
//  main.swift
//  11722
//
//  Created by 유현진 on 11/26/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    let s = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp = Array(repeating: 1, count: N)
    dp[N-1] = 1
    
    for i in (0..<N-1).reversed(){
        for j in i+1..<N{
            if s[i] > s[j]{
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
//    print(dp)
    print(dp.max()!)
}
solution()
