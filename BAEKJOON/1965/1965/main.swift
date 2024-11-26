//
//  main.swift
//  1965
//
//  Created by 유현진 on 11/26/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    let box = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp = Array(repeating: 1, count: N)
    
    for i in (0..<N-1).reversed(){
        for j in i+1..<N{
            if box[i] < box[j]{
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    print(dp.max()!)
}
solution()
