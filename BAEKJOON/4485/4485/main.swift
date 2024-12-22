//
//  main.swift
//  4485
//
//  Created by 유현진 on 12/22/24.
//

import Foundation

//func solution(){
//    var t = 0
//    while true{
//        let N = Int(readLine()!)!
//        if N == 0 { break }
//        t += 1
//        var map = [[Int]]()
//        for _ in 0..<N{
//            map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
//        }
//        var visited = Array(repeating: Array(repeating: false, count: N), count: N)
//        var result = Int.max
//        func dfs(cur: (Int, Int), sum: Int){
//            if cur.0 == N-1, cur.1 == N-1 {
//                result = min(result, sum)
//                return
//            }
//            let dx = [0, 0, 1, -1]
//            let dy = [1, -1, 0, 0]
//            for i in 0..<dx.count{
//                let nx = cur.0 + dx[i]
//                let ny = cur.1 + dy[i]
//                if nx >= 0, nx < N, ny >= 0, ny < N, visited[nx][ny] == false{
//                    visited[nx][ny] = true
//                    dfs(cur: (nx, ny), sum: sum+map[nx][ny])
//                    visited[nx][ny] = false
//                }
//            }
//        }
//        dfs(cur: (0, 0), sum: map[0][0])
//        print("Problem \(t): \(result)")
//    }
//}

func solution(){
    var t = 0
    while true{
        let N = Int(readLine()!)!
        if N == 0 { break }
        t += 1
        var map = [[Int]]()
        for _ in 0..<N{
            map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
        }
        var result = Array(repeating: Array(repeating: 1000000, count: N), count: N)
        result[0][0] = map[0][0]
        
        var queue = [(0,0)]
        
        while !queue.isEmpty{
            let dx = [0, 0, 1, -1]
            let dy = [1, -1, 0, 0]
            var newQueue = [(Int, Int)]()
            for q in queue{
                for i in 0..<dx.count{
                    let nx = q.0 + dx[i]
                    let ny = q.1 + dy[i]
                    if nx >= 0, nx < N, ny >= 0, ny < N{
                        if result[q.0][q.1] + map[nx][ny] < result[nx][ny]{
                            newQueue.append((nx,ny))
                            result[nx][ny] = min(result[q.0][q.1] + map[nx][ny], result[nx][ny])
                        }
                    }
                }
            }
            queue = newQueue
        }
        print("Problem \(t): \(result[N-1][N-1])")
    }
}
solution()
