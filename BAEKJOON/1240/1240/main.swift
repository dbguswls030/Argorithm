//
//  main.swift
//  1240
//
//  Created by 유현진 on 12/20/24.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var map = Array(repeating: Array(repeating: Int.max, count: N), count: N)
    
    for _ in 0..<N-1{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[input[0]-1][input[1]-1] = input[2]
        map[input[1]-1][input[0]-1] = input[2]
    }
    
    for z in 0..<N{
        for x in 0..<N{
            for y in 0..<N{
                if map[x][z] != Int.max, map[z][y] != Int.max{
                    map[x][y] = min(map[x][z] + map[z][y], map[x][y])
                }
            }
        }
    }
    
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        print(map[input[0]-1][input[1]-1])
    }
}

solution()
