//
//  main.swift
//  1072
//
//  Created by 유현진 on 10/28/24.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let X = input[0]
    let Y = input[1]
    let cur = (Y*100) / X
    if cur == 99, X == Y{
        print("-1")
        return
    }
    var left = 1
    var right = 1000000000
    var result = Int.max
    
    while left<=right{
        let mid = (left + right) / 2
        let n = ((Y+mid)*100) / (X+mid)
        if cur != n{
            right = mid - 1
            result = mid
        }else{
            left = mid + 1
        }
    }
    print(result == Int.max ? -1 : result)
}
solution()
