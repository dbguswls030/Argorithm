//
//  main.swift
//  10819
//
//  Created by 유현진 on 10/16/24.
//

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: N)
var result = 0

func solution(){
    for i in 0..<N{
        visited[i] = true
        dfs(dept: 1, temp: [arr[i]])
        visited[i] = false
    }
    print(result)
}

func dfs(dept: Int, temp: [Int]){
    if dept == N{
        findMax(seq: temp)
        return
    }
    
    for i in 0..<N{
        if visited[i] == false{
            visited[i] = true
            var a = temp
            a.append(arr[i])
            dfs(dept: dept+1, temp: a)
            visited[i] = false
        }
    }
}
func findMax(seq: [Int]){
    var sum = 0
    for i in 0..<N-1{
        sum += abs(seq[i] - seq[i+1])
    }
    result = max(sum, result)
}

solution()
