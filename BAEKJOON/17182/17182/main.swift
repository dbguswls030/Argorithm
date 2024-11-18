//
//  main.swift
//  17182
//
//  Created by 유현진 on 11/18/24.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let K = input[1]
    var map = [[Int]]()
    var result = Int.max
    var visited = Array(repeating: false, count: N)
    visited[K] = true
    
    for _ in 0..<N{
        map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    for i in 0..<N{
        for j in 0..<N{
            for z in 0..<N{
                map[j][z] = min(map[j][z], map[j][i] + map[i][z])
            }
        }
    }
    
    func dfs(cur: Int, dept: Int, T: Int){
        if dept == N{
            result = min(result, T)
            return
        }
        
        for i in 0..<N{
            if !visited[i]{
                visited[i] = true
                dfs(cur: i,  dept: dept+1, T: T + map[cur][i])
                visited[i] = false
            }
        }
    }
    dfs(cur: K, dept: 1, T: 0)
    print(result)
}
solution()
