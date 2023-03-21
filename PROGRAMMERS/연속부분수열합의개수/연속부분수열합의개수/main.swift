//
//  main.swift
//  연속부분수열합의개수
//
//  Created by 유현진 on 2023/03/21.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    var sumSet = Set<Int>()
    func caseOfsum(len: Int){
        for index in 0..<elements.count{
            var sum = 0
            for i in 0..<len{
                var extendIndex = index + i
                if extendIndex >= elements.count { extendIndex %= elements.count }
                sum += elements[extendIndex]
            }
            sumSet.insert(sum)
        }
    }
    for len in 0..<elements.count{
        caseOfsum(len: len)
    }
    return sumSet.count
}

print(solution([7,9,1,1,4]))
