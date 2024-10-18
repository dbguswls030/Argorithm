//
//  main.swift
//  2309
//
//  Created by 유현진 on 10/18/24.
//

import Foundation

func solution(){
    var height = [Int]()
    var arr = [Int]()
    var result = [Int]()
    var sum = 0
    for _ in 0..<9{
        height.append(Int(readLine()!)!)
    }
    
    for i in 0...9-7{
        arr.append(height[i])
        sum += height[i]
        dfs(index: i+1)
        arr.removeLast()
        sum -= height[i]
        
    }
    
    result.forEach{
        print($0)
    }
    
    func dfs(index: Int){
        if arr.count == 7{
            if sum == 100{
                result = arr.sorted()
            }
            return
        }
        
        for i in index..<9{
            sum += height[i]
            arr.append(height[i])
            dfs(index: i+1)
            arr.removeLast()
            sum -= height[i]
        }
    }
}
solution()
