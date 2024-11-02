//
//  main.swift
//  2805
//
//  Created by 유현진 on 11/2/24.
//

import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int64(String($0))!}
    let N = input[0]
    let M = input[1]
    input = readLine()!.split(separator: " ").map{Int64(String($0))!}

    var left: Int64 = 1
    var right = input.max()!

    var result: Int64 = 0

    while left <= right{
        let mid = (left+right) / 2
        
        var sum: Int64 = 0
        for i in input{
            if i - mid > 0{
                sum += i - mid
            }
        }
        if sum >= M{
            left = mid + 1
            result = mid
        }else{
            right = mid - 1
        }
    }
    print(result)
}
solution()
