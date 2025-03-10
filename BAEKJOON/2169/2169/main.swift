//
//  main.swift
//  2169
//
//  Created by 유현진 on 3/9/25.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var mars = [[Int]]()
    
    for _ in 0..<N{
        mars.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    for i in 1..<M{
        mars[0][i] += mars[0][i-1]
    }
    
    for i in 1..<N{
        var leftToRight = mars[i]
        var rightToLeft = mars[i]
        
        for j in 0..<M{
            if j == 0 {
                leftToRight[j] += mars[i-1][j]
            }else{
                leftToRight[j] += max(mars[i-1][j], leftToRight[j-1])
            }
        }
        
        for j in (0..<M).reversed(){
            if j == M-1{
                rightToLeft[j] += mars[i-1][j]
            }else{
                rightToLeft[j] += max(mars[i-1][j], rightToLeft[j+1])
            }
        }
        
        for j in 0..<M{
            mars[i][j] = max(leftToRight[j], rightToLeft[j])
        }
    }
    
    print(mars[N-1][M-1])
}
solution()

