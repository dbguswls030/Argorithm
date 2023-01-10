//
//  main.swift
//  콜라 문제
//
//  Created by 유현진 on 2023/01/10.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var count = 0
    var n = n
    
    while n >= a {
        count += (n/a)*b
        n = n/a*b + n%a
    }
    return count
}

print(solution(2, 1, 20))
print(solution(3, 1, 20))
print(solution(3, 2, 20))
print(solution(3, 2, 10))
