//
//  main.swift
//  24444
//
//  Created by 유현진 on 11/1/24.
//

import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    let R = input[2]

    var map = Array(repeating: [Int](), count: N+1)
    
    for _ in 0..<M {
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[input[0]].append(input[1])
        map[input[1]].append(input[0])
    }
    var result = Array(repeating: 0, count: N+1)
    
    for i in 1..<map.count{
        map[i].sort()
    }
    var queueIndex = 0
    func bfs(queue: [Int]){
        var queue = queue
        
        while queueIndex != queue.count {
            let cur = queue[queueIndex]
            queueIndex+=1
            for i in map[cur]{
                if result[i] == 0{
                    queue.append(i)
                    result[i] = count
                    count += 1
                }
            }
        }
    }
    var count = 1
    result[R] = count
    count += 1
    
    bfs(queue: [R])
    
    for i in 1...N{
        print(result[i])
    }
}
solution()
