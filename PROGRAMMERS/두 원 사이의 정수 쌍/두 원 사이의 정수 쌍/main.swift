//
//  main.swift
//  두 원 사이의 정수 쌍
//
//  Created by 유현진 on 2023/06/20.
//

import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var result = 0
    for i in 1...r2{
        let lowLen = i >= r1 ? 0 : ceil(sqrt(Double(r1*r1-i*i)))
        let highLen = floor(sqrt(Double(r2*r2-i*i)))
        result += Int(highLen - lowLen) + 1
    }
    result *= 4
    return Int64(result)
}
print(solution(2, 3))

