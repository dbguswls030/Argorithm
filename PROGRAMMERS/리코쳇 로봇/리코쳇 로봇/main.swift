//
//  main.swift
//  리코쳇 로봇
//
//  Created by 유현진 on 2023/06/22.
//

import Foundation

func solution(_ board:[String]) -> Int {
    var map = [[String]]()
    for b in board{
        map.append(b.map{String($0)})
    }
    var dp = Array(repeating: Array(repeating: Int.max, count: map[0].count), count: map.count)
    var visited = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
    var start = (0,0)
    var end = (0,0)
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] == "R"{
                start = (i,j)
            }
            if map[i][j] == "G"{
                end = (i,j)
            }
        }
    }
    
    dp[start.0][start.1] = 0
    let x = [0,0,-1,1]
    let y = [1,-1,0,0]
    
    func bfs(queue: [(Int, Int)],count: Int){
        var queue = queue
        var temp = [(Int,Int)]()
        while !queue.isEmpty{
            let current = queue.removeFirst()
            visited[current.0][current.1] = true
            for i in 0..<x.count{
                var dx = current.0
                var dy = current.1
                while true{
                    if dx + x[i] < 0 || dx + x[i] > map.count - 1 || dy + y[i] < 0 || dy + y[i] > map[0].count - 1{
                        break
                    }
                    if map[dx + x[i]][dy + y[i]] == "D"{
                        break
                    }
                    dx += x[i]
                    dy += y[i]
                }
                dp[dx][dy] = min(dp[dx][dy], count)
                if visited[dx][dy] == false{
                    temp.append((dx, dy))
                }
            }
        }
        if !temp.isEmpty, dp[end.0][end.1] == Int.max {bfs(queue: temp, count: count + 1)}
    }
    
    bfs(queue: [start], count: 1)
    return dp[end.0][end.1] == Int.max ? -1 : dp[end.0][end.1]
}
print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))
