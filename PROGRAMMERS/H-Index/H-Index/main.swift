//
//  main.swift
//  H-Index
//
//  Created by 유현진 on 2023/08/28.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: <)
//    print(citations)
    
    var index = 0
    var h = 0
    
    while index < citations.count{
        
        let right = citations.count - index
//        print("cur: \(citations[index]), count : \(right), h : \(h)")
        if citations[index] >= h{
            if h >= right{
                return right
            }
            h += 1
        }else{
            index += 1
        }
    }
    return 0
}

print(solution([3, 0, 6, 1, 5]))
print(solution([2, 6, 5, 9, 10, 5]))
print(solution([4, 0, 6, 1, 5]))
print(solution([2, 0, 6, 1, 5]))
print(solution([2,8,9,10,5]))
