//
//  main.swift
//  11055
//
//  Created by 유현진 on 11/26/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    let seq = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp = seq
    
    for i in (0..<N-1).reversed(){
        for j in i+1..<N{
            if seq[i] < seq[j]{
                dp[i] = max(dp[i], seq[i] + dp[j] )
                
            }
        }
    }
    print(dp.max()!)
}
solution()
