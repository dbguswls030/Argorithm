//
//  main.swift
//  7569
//
//  Created by 유현진 on 11/8/24.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let M = input[0]
    let N = input[1]
    let H = input[2]
    var map = [[Int]]()
    let dx = [1,0,0,-1]
    let dy = [0,1,-1,0]
    var count = 0
    
    for _ in 0..<N*H{
        map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    var queue = [(Int, Int)]()
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] == 1{
                queue.append((i,j))
            }
        }
    }
    while !queue.isEmpty{
        var newQueue = [(Int, Int)]()
        for q in queue{
            for index in 0..<dx.count{
                let nx = q.0 + dx[index]
                let ny = q.1 + dy[index]
                var a = q.0 / N + 1
                
                if nx >= N * a - N && nx < N * a && ny >= 0 && ny < M && map[nx][ny] == 0{
                    map[nx][ny] = 1
                    newQueue.append((nx,ny))
                }
            }
            let up = q.0 - N
            let down = q.0 + N
            if up >= 0 && map[up][q.1] == 0{
                map[up][q.1] = 1
                newQueue.append((up, q.1))
            }
            if down < N*H && map[down][q.1] == 0{
                map[down][q.1] = 1
                newQueue.append((down, q.1))
            }
        }
    
        if newQueue.isEmpty{
            break
        }
        queue = newQueue
        count += 1
    }
    
    var complete = true
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] == 0{
                complete = false
            }
        }
    }
    
    print(complete ? count : -1)
    
}
solution()
