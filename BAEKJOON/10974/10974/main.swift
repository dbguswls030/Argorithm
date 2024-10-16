//
//  main.swift
//  10974
//
//  Created by 유현진 on 10/16/24.
//

import Foundation

let N = Int(readLine()!)!
var visited = Array(repeating: false, count: N)
var s = [[Int]]()
func solution(){
    for i in 1...N{
        visited[i-1] = true
        dfs(dept: 1, temp: [i])
        visited[i-1] = false
    }
    for i in 0..<N{
        for j in 0..<N{
            print(s[i][j],terminator: " ")
        }
        print()
    }
}

func dfs(dept: Int, temp: [Int]){
    if dept == N{
        s.append(temp)
        return
    }
    
    for i in 1...N{
        if visited[i-1] == false{
            visited[i-1] = true
            var a = temp
            a.append(i)
            dfs(dept: dept+1, temp: a)
            visited[i-1] = false
        }
    }
}

solution()
