//
//  main.swift
//  11659
//
//  Created by 유현진 on 2023/04/26.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var prefix = [0]
    
    for i in 0..<N{
        if i == 0 {
            prefix.append(arr[i])
        }else{
            prefix.append(arr[i] + prefix[i])
        }
    }
    
    for _ in 0..<M{
        let ij = readLine()!.split(separator: " ").map{Int(String($0))!}
        let i = ij[0] - 1
        let j = ij[1] - 1
        print(prefix[j+1] - prefix[i])
    }
}
solution()
