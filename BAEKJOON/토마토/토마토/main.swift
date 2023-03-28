//
//  main.swift
//  토마토
//
//  Created by 유현진 on 2023/03/28.
//

import Foundation

func solution() -> Int{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var map = [[Int]]()
    var count = -1
    var clear = true
    for _ in 0..<input[1]{
        let tomato = readLine()!.split(separator: " ").map{Int(String($0))!}
        if clear == true {
            if tomato.contains(0){ clear = false }
        }
        map.append(tomato)
    }
    if clear == true { return 0 } // 토마도가 모두 익어 있음
    
    var q = [(Int,Int)]()
    
    // 가장 처음 익어 있는 토마토 찾고 큐에 넣어줌
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] == 1{
                q.append((i,j))
            }
        }
    }
    
    while !q.isEmpty{
        bfs(queue: q)
        count += 1
    }
    
    func bfs(queue: [(Int,Int)]){
        q.removeAll()
        let x = [1,0,0,-1]
        let y = [0,1,-1,0]
        for index in queue{
            for i in 0..<x.count{
                let dx = x[i] + index.0
                let dy = y[i] + index.1
                if 0..<input[1] ~= dx, 0..<input[0] ~= dy{
                    if map[dx][dy] == 0 {
                        map[dx][dy] = 1
                        q.append((dx, dy))
                    }
                }
            }
            
        }
    }
    
    // 토마토가 다 익었는지 확인, 다 익었으면 true : 안 익은 토마토가 있으면 false
    var isClear = true
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] == 0 {
                isClear = false
            }
        }
    }
    
    
    return isClear ? count : -1
}

print(solution())
