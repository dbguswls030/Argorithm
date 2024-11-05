//
//  main.swift
//  7562
//
//  Created by 유현진 on 11/5/24.
//

import Foundation

func solution(){
    let dx = [1,2, 1, 2,-1,-2,-1,-2]
    let dy = [2,1,-2,-1,-2,-1, 2, 1]
    
    for _ in 0..<Int(readLine()!)!{
        let N = Int(readLine()!)!
        var visited = Array(repeating: Array(repeating: false, count: N), count: N)
        let start = readLine()!.split(separator: " ").map{Int(String($0))!}
        let dst = readLine()!.split(separator: " ").map{Int(String($0))!}
        var count = 0
        var result = Int.max
        func bfs(queue: [(Int, Int)]){
            var newQueue = [(Int,Int)]()
            for q in queue{
                if q == (dst[0], dst[1]){
                    result = min(result,count)
                    return
                }
                for index in 0..<dx.count{
                    let nx = q.0 + dx[index]
                    let ny = q.1 + dy[index]
                    if nx >= 0 && nx < N && ny >= 0 && ny < N && !visited[nx][ny]{
                        visited[nx][ny] = true
                        newQueue.append((nx,ny))
                    }
                }
            }
            count += 1
            bfs(queue: newQueue)
        }
        bfs(queue: [(start[0], start[1])])
        print(result == Int.max ? 0 : result)
    }
}

solution()
