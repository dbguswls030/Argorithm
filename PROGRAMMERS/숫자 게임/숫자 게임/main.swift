//
//  main.swift
//  숫자 게임
//
//  Created by 유현진 on 2023/10/02.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    let aa = a.sorted(by: <)
    let bb = b.sorted(by: <)
    
    for i in 0..<a.count{
        if aa[i] < bb[i]{
            result += 1
        }
    }
    
    
    return result
}

print(solution([5,1,3,7], [2,2,6,8]))
print(solution([2,2,2,2], [1,1,1,1]))
