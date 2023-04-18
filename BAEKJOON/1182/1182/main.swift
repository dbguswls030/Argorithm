//
//  main.swift
//  1182
//
//  Created by 유현진 on 2023/04/19.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let S = input[1]
    let arrs = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = 0
    var sum = 0
    
    func dfs(index: Int, dept: Int){
        if sum == S, dept > 0{
            result += 1
        }
        
        for i in index..<N{
            sum += arrs[i]
            dfs(index: i + 1, dept: dept + 1)
            sum -= arrs[i]
        }
    }
    
    dfs(index: 0, dept: 0)
    print(result)
}

solution()
