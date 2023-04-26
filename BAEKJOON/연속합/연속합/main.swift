//
//  main.swift
//  연속합
//
//  Created by 유현진 on 2023/04/25.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp = [arr[0]]
    for i in 1..<n{
        dp.append(max(dp[i-1] + arr[i], arr[i]))
    }
    print(dp.max()!)
}

solution()
