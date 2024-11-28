//
//  main.swift
//  11054
//
//  Created by 유현진 on 11/28/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var prevDP = Array(repeating: 1, count: N)
    var nextDP = Array(repeating: 1, count: N)
    let seq = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = 0
    for i in 0..<N{
        for j in 0..<i{
            if seq[i] > seq[j], prevDP[i] < prevDP[j] + 1{
                prevDP[i] = prevDP[j] + 1
            }
        }
    }
    
    for i in (0..<N-1).reversed(){
        for j in i+1..<N{
            if seq[i] > seq[j], nextDP[i] < nextDP[j] + 1{
                nextDP[i] = nextDP[j] + 1
            }
        }
    }
    
    for i in 0..<N{
        result = max( prevDP[i] + nextDP[i], result)
    }
    print(prevDP)
    print(nextDP)
    print(result-1)
}
solution()
