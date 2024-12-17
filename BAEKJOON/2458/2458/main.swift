//
//  main.swift
//  2458
//
//  Created by 유현진 on 12/16/24.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var map = Array(repeating: Array(repeating: false, count: N), count: N)
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[input[0]-1][input[1]-1] = true
    }
    var result = N
    for z in 0..<N{
        for x in 0..<N{
            for y in 0..<N{
                if map[x][z] != false, map[z][y] != false{
                    map[x][y] = true
                }
            }
        }
    }
    
    func isComparable(cur: Int) -> Bool{
        var inputIndex = [Int]()
        for i in 0..<N{
            if cur != i, map[cur][i] == false{
                inputIndex.append(i)
            }
        }
        for i in inputIndex{
            if cur != i, map[i][cur] == false{
                return false
            }
        }
        return true
    }
    for i in 0..<N{
        if !isComparable(cur: i){
            result -= 1
        }
    }
    print(result)
}
solution()
