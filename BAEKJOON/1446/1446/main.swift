//
//  main.swift
//  1446
//
//  Created by 유현진 on 3/19/25.
//

import Foundation
// 그냥 갈 떄와 지름길 갈 때 뭐가 더 빠른지

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let D = input[1]

    var dist = [[Int]]()
    var dp = Array(0...D)

    for _ in 0..<N{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input[1] - input[0] < input[2] { continue }
        dist.append(input)
    }
    dist.sort{$0[0] < $1[0]}
    
    for i in 0..<dist.count{
        let start = dist[i][0]
        let end = dist[i][1]
        let distance = dist[i][2]

        for index in 1...D{
            if end == index{ // dp 변경 되지 않았을 때
                dp[index] = min(dp[index], dp[start] + distance)
            }else{
                dp[index] = min(dp[index], dp[index-1]+1)
            }
        }
    }
    print(dp[D])
}

solution()
