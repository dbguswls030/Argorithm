//
//  main.swift
//  1389
//
//  Created by 유현진 on 12/7/24.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var map = Array(repeating: Array(repeating: Int.max/100, count: N), count: N)
    
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let x = input[0] - 1
        let y = input[1] - 1
        map[x][y] = 1
        map[y][x] = 1
    }
    
    for z in 0..<N{
        for x in 0..<N{
            for y in 0..<N{
                if x == y { continue }
                map[x][y] = min(map[x][y], map[x][z] + map[z][y])
            }
        }
    }
    
    var result = -1
    var sum = Int.max
    for i in 0..<map.count{
        let total = map[i].reduce(0, +)
        if sum > total{
            result = i + 1
            sum = total
        }
    }
    print(result)
}

solution()
// 1, 3
// 1, 4
// 2, 3
// 3, 4
// 4, 5
