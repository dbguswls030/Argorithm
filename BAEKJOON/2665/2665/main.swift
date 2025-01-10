//
//  main.swift
//  2665
//
//  Created by 유현진 on 1/10/25.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var map = [[Int]]()
    for _ in 0..<N{
        map.append(readLine()!.map{Int(String($0))!})
    }
    let dx = [0,1,-1,0]
    let dy = [1,0,0,-1]

    var visited = Array(repeating: Array(repeating: 99999, count: N), count: N)
    var queue = [(Int,Int)]()
    visited[0][0] = 0
    queue.append((0,0))
    var index = 0
    while index != queue.count{
        let q = queue[index]
        index += 1
        let x = q.0
        let y = q.1
        
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || ny < 0 || nx >= N || ny >= N{
                continue
            }
            
            if map[nx][ny] == 0, visited[x][y] < visited[nx][ny]{ // 검은방일 때
                visited[nx][ny] = visited[x][y] + 1
                queue.append((nx,ny))
            }else if map[nx][ny] == 1, visited[x][y] < visited[nx][ny]{ // 흰방일 때
                visited[nx][ny] = visited[x][y]
                queue.append((nx,ny))
            }
            
        }
    }

    print(visited[N-1][N-1])
}
solution()
