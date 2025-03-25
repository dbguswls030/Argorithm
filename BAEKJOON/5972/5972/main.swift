//
//  main.swift
//  5972
//
//  Created by 유현진 on 3/24/25.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var d = Array(repeating: Int.max, count: N)
    d[0] = 0
    var map = Array(repeating: [(Int,Int)](), count: N)
    
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[input[0]-1].append((input[1]-1,input[2]))
        map[input[1]-1].append((input[0]-1,input[2]))
    }

    for i in 0..<N{
        map[i].sort(by: {$0.1 < $1.1})
    }
    
    var queue = [Int]()
    queue.append(0)
    
    while !queue.isEmpty{
        var newQueue = [Int]()
        for q in queue{
            for next in map[q]{
                if d[next.0] > d[q] + next.1{
                    d[next.0] = d[q] + next.1
                    newQueue.append(next.0)
                }
            }
        }
        queue = newQueue
    }
    print(d[N-1])
}

solution()

