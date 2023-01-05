//
//  main.swift
//  점찍기
//
//  Created by 유현진 on 2023/01/05.
//

import Foundation


func solution(_ k:Int, _ d:Int) -> Int64 {
    var count: Int64 = 0
    let result = d * d
    for i in stride(from: 0, through: d, by: k){
        let x = i * i
        print("\(result) >= \(x) / \(k * k)")
        count += Int64(Int(sqrt(Double(result - x))) / k + 1)
        
    }
    return count
}

print(solution(2, 4))
print(solution(1, 5))
