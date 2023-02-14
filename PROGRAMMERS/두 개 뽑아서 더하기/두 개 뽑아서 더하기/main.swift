//
//  main.swift
//  두 개 뽑아서 더하기
//
//  Created by 유현진 on 2023/02/14.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Set<Int>()
    for (topIndex, topValue) in numbers.enumerated() {
        for (bottomIndex, bottomValue) in numbers.enumerated(){
            if topIndex != bottomIndex {
                result.insert(topValue + bottomValue)
            }
        }
    }
    return result.sorted(by: <)
}

print(solution([2,1,3,4,1]))
print(solution([5,0,2,7]))
