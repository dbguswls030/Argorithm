//
//  main.swift
//  삼총사
//
//  Created by 유현진 on 2023/01/10.
//

import Foundation

func solution(_ number:[Int]) -> Int {
    var count = 0
    
    for i in 0..<number.count-2{
        for j in i+1..<number.count-1{
            for z in j+1..<number.count{
                if number[i]+number[j]+number[z] == 0 {
                    print(number[i],number[j],number[z])
                    count += 1
                }
            }
        }
    }
    return count
}

print(solution([-2, 3, 0, 2, -5]))
print(solution([-3, -2, -1, 0, 1, 2, 3]))
print(solution([-1, 1, -1, 1]))
