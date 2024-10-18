//
//  main.swift
//  2529
//
//  Created by 유현진 on 10/18/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    let sign = readLine()!.split(separator: " ").map{String($0)}
    var visited = Array(repeating: false, count: 10)
    var result = [Int]()
    var minArr = [Int]()
    var maxArr = [Int]()
    var minResult = Int.max
    var maxResult = Int.min
    
    for i in 0..<10{
        visited[i] = true
        result.append(i)
        dfs(index: i+1, dept: 0)
        result.removeLast()
        visited[i] = false
    }
    
    print(maxArr.map{String($0)}.joined())
    print(minArr.map{String($0)}.joined())
    
    func dfs(index: Int, dept: Int){
        if result.count == N+1{
            let num = Int(result.map{String($0)}.joined())!
            if minResult > num{
                minResult = num
                minArr = result
            }
            if maxResult < num{
                maxResult = num
                maxArr = result
            }
            return
        }
        for i in 0..<10{
            if visited[i] == false{
                var isAddable = false
                if sign[dept] == "<", result.last! < i{
                    isAddable = true
                }else if sign[dept] == ">", result.last! > i{
                    isAddable = true
                }
                if isAddable{
                    visited[i] = true
                    result.append(i)
                    dfs(index: i+1, dept: dept+1)
                    result.removeLast()
                    visited[i] = false
                }
                
            }
        }
    }
}

solution()
