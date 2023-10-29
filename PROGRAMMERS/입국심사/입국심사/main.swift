//
//  main.swift
//  입국심사
//
//  Created by 유현진 on 2023/10/29.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var left = Int64(times[0])
    var right = Int64(times.max()! * n)
    var result = left
    while left <= right{
        var mid = (left + right) / 2
        
        var success: Int64 = 0
        for time in times {
            success += mid / Int64(time)
        }
    
        if n > success{
            left = mid + 1
        }else {
            result = mid
            right = mid - 1
        }
    }
    return result
}
print(solution(6, [7, 10]))


