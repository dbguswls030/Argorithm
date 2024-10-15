//
//  main.swift
//  14501
//
//  Created by 유현진 on 10/15/24.
//

import Foundation

let N = Int(readLine()!)!
var table = [[Int]]()
var result = 0

for _ in 0..<N{
    table.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
func solution(){
    for index in 0..<N{
        dfs(i: index+1, sum: 0, task: table[index][0]-1)
    }
    print(result)
}

func dfs(i: Int, sum: Int, task: Int){
    var task = task
    
    for index in i..<N{
        if task <= 0{
            result = max(result, sum + table[i-1][1])
            dfs(i: index+1, sum: sum + table[i-1][1], task: table[index][0]-1)
        }
        task -= 1
    }
    if task == 0{
        result = max(result, sum + table[i-1][1])
    }
}
solution()
