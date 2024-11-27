//
//  main.swift
//  2631
//
//  Created by 유현진 on 11/27/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var s = [Int]()
    var dp = Array(repeating: 1, count: N)
    for _ in 0..<N{
        s.append(Int(readLine()!)!)
    }
    
    for i in (0..<N-1).reversed(){
        for j in i+1..<N{
            if s[i] < s[j]{
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    print(N-dp.max()!)
}

solution()
