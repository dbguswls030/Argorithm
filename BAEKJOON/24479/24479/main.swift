//
//  main.swift
//  24479
//
//  Created by 유현진 on 10/31/24.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let N = input[0]
    let M = input[1]
    let R = input[2]

    var map = Array(repeating: [Int](), count: N+1)
    for _ in 0..<M{
        input = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[input[0]].append(input[1])
        map[input[1]].append(input[0])
    }
    
    var result = Array(repeating: 0, count: N+1)
    var cur = 1
    dfs(v: R)
    
    func dfs(v: Int){
        if result[v] == 0{
            result[v] = cur
            cur += 1
        }
        for i in map[v].sorted(){
            if result[i] == 0{
                dfs(v: i)
            }
        }
    }
    for i in result[1..<result.count]{
        print(i)
    }
}

solution()
