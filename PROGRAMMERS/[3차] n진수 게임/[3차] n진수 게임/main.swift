//
//  main.swift
//  [3차] n진수 게임
//
//  Created by 유현진 on 2023/08/17.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result = ""
    var index = 0
    var order = 1
    while result.count < t{
        for i in String(index, radix: n){
            if order == p {
                result += String(i)
            }
            if result.count == t{
                break
            }
            order += 1
            if order == m + 1{
                order = 1
            }
        }
        index += 1
    }
    return result.uppercased()
}

print(solution(2, 4, 2, 1))
print(solution(16, 16, 2, 1))
print(solution(16, 16, 2, 2))
