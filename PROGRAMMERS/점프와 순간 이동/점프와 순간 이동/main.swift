//
//  main.swift
//  점프와 순간 이동
//
//  Created by 유현진 on 2023/08/14.
//

import Foundation

func solution(_ n:Int) -> Int{
    var n = n
    var count = 0
    while n > 0{
        if n % 2 == 0{
            n /= 2
        }else{
            n -= 1
            count += 1
        }
    }
    return count
}
print(solution(1))
print(solution(5))
print(solution(6))
print(solution(5000))
