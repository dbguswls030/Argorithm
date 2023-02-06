//
//  main.swift
//  연결 요소의 개수
//
//  Created by 유현진 on 2023/01/25.
//

import Foundation

func solution(){
    func bfs(start: Int){
        visited[start] = 1
        var queue = [start]
        
        while !queue.isEmpty{
            let node = queue.removeFirst()
            
            for item in map[node]{
                if visited[item] == 0{
                    queue.append(item)
                    visited[item] = 1
                }
            }
        }
        
    }
    var input = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    
    let N = input[0]
    let M = input[1]
    var map = Array(repeating: [Int](), count: N+1)
    var visited = Array(repeating: 0, count: N + 1)
    
    for _ in 0..<M{
        input = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
        let x = input[0]
        let y = input[1]
        map[x].append(y)
        map[y].append(x)
    }
    
   
    
    var count = 0
    for i in 1...N{
        if visited[i] == 0{
            count += 1
            bfs(start: i)
        }
    }
    print(count)
}
solution()

