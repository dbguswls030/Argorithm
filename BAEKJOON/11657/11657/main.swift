//
//  main.swift
//  11657
//
//  Created by 유현진 on 12/9/24.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var edges = Array(repeating: [(Int,Int)](), count: N+1)
    var result = Array(repeating: Int.max, count: N+1)
    
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges[input[0]].append((input[1], input[2]))
    }
    func bf(start: Int) -> Bool{
        result[start] = 0
        
        for index in 1...N{
            for cur in 1...N{
                for edge in edges[cur]{
                    let next = edge.0
                    let cost = edge.1
                    
                    if result[cur] != Int.max, result[next] > result[cur] + cost{
                        result[next] = result[cur] + cost
                        
                        if index == N{
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
    if bf(start: 1){
        print("-1")
    }else{
        for i in 2...N{
            if result[i] == Int.max{
                print("-1")
            }else{
                print(result[i])
            }
        }
    }
}
solution()
