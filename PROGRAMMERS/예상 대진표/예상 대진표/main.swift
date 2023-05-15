//
//  main.swift
//  예상 대진표
//
//  Created by 유현진 on 2023/05/15.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var a = a
    var b = b
    var answer = 0
    
    while a != b{
        answer += 1
        if a % 2 == 1 { a += 1}
        if b % 2 == 1 { b += 1}
        a/=2
        b/=2
    }
    return answer
}

print(solution(8, 4, 7))
print(solution(8, 4, 5))
