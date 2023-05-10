//
//  main.swift
//  N개의 최소공배수
//
//  Created by 유현진 on 2023/05/10.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    var result = 0
    var flag = true
    while flag{
        result += arr.last!
        flag = false
        for i in arr{
            if result % i != 0 {
                flag = true
                break
            }
        }
    }
    return result
}
print(solution([2,6,8,14]))
