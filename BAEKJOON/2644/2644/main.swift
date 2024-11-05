//
//  main.swift
//  2644
//
//  Created by 유현진 on 11/5/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var map = Array(repeating: [Int](), count: N+1)
    var visited = Array(repeating: false, count: N+1)
    let left = input[0]
    let right = input[1]
    var result = -1
    for _ in 0..<Int(readLine()!)!{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let x = input[0]
        let y = input[1]
        map[x].append(y)
        map[y].append(x)
    }
    
    
    func dfs(cur: Int, dept: Int){
        if cur == right{
            result = dept
            return
        }
        for i in map[cur]{
            if visited[cur] == false{
                visited[cur] = true
                dfs(cur: i, dept: dept + 1)
                visited[cur] = false
            }
        }
    }
    dfs(cur: left, dept: 0)
    print(result)
}

solution()
