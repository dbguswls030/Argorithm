//
//  main.swift
//  풍선 터트리기
//
//  Created by 유현진 on 2023/05/23.
//

import Foundation
func solution(_ a:[Int]) -> Int {
    var minIndex = -1
    var min = 1000000001
    var result = 0
    for i in 0..<a.count{
        if min > a[i] {
            min = a[i]
            minIndex = i
        }
    }
    min = a[0]
    for i in 1...minIndex{
        if min > a[i]{
            result += 1
            min = a[i]
        }
    }
    min = a[a.count - 1]
    for i in stride(from: a.count-2, through: minIndex, by: -1){
        if min > a[i]{
            result += 1
            min = a[i]
        }
    }
    
    
    
    return result + 1
}

print(solution([9,-1,-5]))
print(solution([-16,27,65,-2,58,-92,-71,-68,-61,-33]))
