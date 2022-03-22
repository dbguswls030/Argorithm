//
//  main.swift
//  2579
//
//  Created by 유현진 on 2022/03/21.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var s = [Int]()
    var dp = Array(repeating: 0, count: n)
    for _ in 0..<n{
        s.append(Int(readLine()!)!)
    }
    for i in 0..<n{
        if i == 0{
            dp[i] = s[i]
        }else if i == 1{
            dp[i] = s[i]+s[i-1]
        }else if i == 2{
            dp[i] = max(s[i]+s[i-1], s[i]+s[i-2])
        }else{
            dp[i] = max(dp[i-3]+s[i-1]+s[i], dp[i-2]+s[i])
        }
    }
    print(dp[n-1])
}
solution()
