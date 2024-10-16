//
//  main.swift
//  10971
//
//  Created by 유현진 on 10/16/24.
//

import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var visited = Array(repeating: false, count: N)

var result = Int.max
for _ in 0..<N{
    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func solution(){
    for i in 0..<N{
        visited[i] = true
        dfs(first: i, prev: i, count: 1, cost: 0)
        visited[i] = false
    }
    print(result)
}

func dfs(first: Int, prev: Int, count: Int, cost: Int){

    if count == N{
        if map[prev][first] != 0{
            result = min(cost+map[prev][first], result)
        }
        return
    }
    
    for i in 0..<N{
        if visited[i] == false, map[prev][i] != 0, result > cost+map[prev][i]{
            visited[i] = true
            dfs(first: first, prev: i, count: count+1, cost: cost+map[prev][i])
            visited[i] = false
        }
    }
    
}

solution()
