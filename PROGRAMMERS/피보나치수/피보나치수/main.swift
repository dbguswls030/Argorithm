//
//  main.swift
//  피보나치수
//
//  Created by 유현진 on 2023/05/01.
//

import Foundation

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+1)
    func f(n: Int) -> Int{
        if n == 1 || n == 2{
            return 1
        }
        if dp[n] != 0 { return dp[n]}
        dp[n] = f(n: n-1) + f(n: n-2)
        return dp[n] % 1234567
    }
    return f(n: n)
}
