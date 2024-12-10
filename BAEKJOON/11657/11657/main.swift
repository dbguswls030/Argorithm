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
    var edges = Array(repeating: [(Int,Int)](), count: N)
    var result = Array(repeating: Int.max, count: N)
    
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges[input[0]-1].append((input[1]-1, input[2]))
    }
    
    result[0] = 0 // 시작 노드는 0으로 초기화
    for i in 0..<N{ // N-1번 반복
        for cur in 0..<edges.count{
            for edge in edges[cur]{
                let next = edge.0
                let cost = edge.1
                
                if result[cur] != Int.max, result[next] > result[cur] + cost{
                    result[next] = result[cur] + cost
                }
            }
        }
    }
    
    for cur in 0..<edges.count{
        for edge in edges[cur]{
            let next = edge.0
            let cost = edge.1
            
            if result[cur] != Int.max, result[next] > result[cur] + cost{
                print("-1")
                return
            }
        }
    }
    
    for i in 1..<N{
        if result[i] == Int.max{
            print("-1")
        }else{
            print(result[i])
        }
    }
}
solution()
//4 6
//1 2 3
//1 3 2
//1 4 5
//2 3 3
//3 4 -4
//4 2 -4
