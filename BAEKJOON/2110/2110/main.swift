//
//  main.swift
//  2110
//
//  Created by 유현진 on 2022/03/24.
//

import Foundation

func solution(){
    var input = readLine()!.components(separatedBy: " ").map() { Int(String($0))!}
    let n = input[0]
    let c = input[1]
    input.removeAll()
    for _ in 0..<n{
        input.append(Int(readLine()!)!)
    }
    input.sort()
    var high = input[input.count-1] - input[0]
    var low = 1
    for i in 1..<input.count{
        low = min(low, input[i]-input[i-1])
    }
    var result = 0
    
    while(low<=high){
        let mid = (high+low)/2
        print("low: \(low), high: \(high), mid: \(mid)")
        var count = 1
        var p = input[0]
        for i in 1..<input.count{
            if (input[i] - p) >= mid{
                p = input[i]
                count+=1
            }
        }
        if c > count {
            high = mid - 1
            
        }else{
            low = mid + 1
            result = mid
        }
    }
    print(result)
}
solution()
