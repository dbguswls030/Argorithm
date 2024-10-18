//
//  main.swift
//  6603
//
//  Created by 유현진 on 10/18/24.
//

import Foundation

func solution(){
    while true{
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let N = input[0]
        if N == 0 { return }
        let arr = Array(input[1..<input.count])
        for i in 0...N-6{
            dfs(index: i+1, arr: arr, result: [arr[i]])
        }
        
        print("")
    }
    
    func dfs(index: Int, arr: [Int], result: [Int]){
        if result.count == 6 {
            print(result.map{String($0)}.joined(separator: " "))
            return
        }
        var result = result
        for i in index..<arr.count{
            result.append(arr[i])
            dfs(index: i+1, arr: arr, result: result)
            result.removeLast()
        }
    }
}

solution()
