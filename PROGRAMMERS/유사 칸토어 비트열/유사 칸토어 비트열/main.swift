//
//  main.swift
//  유사 칸토어 비트열
//
//  Created by 유현진 on 2023/09/04.
//

import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    var result = 0
    var index = l-1
    func check(num: Int64) -> Bool{
        if num % 5 == 2{
            return false
        }
        if num < 5{
            return true
        }
        return check(num: num/5)
    }
    for i in l-1..<r{
        if check(num: i){
            result += 1
        }
    }
    return result
}


print(solution(2, 1, 25))

//print(solution(2, 4, 17))
//print(solution(2, 1, 5))
//print(solution(2, 6, 10))
//print(solution(2, 11, 15))
print(solution(1, 1, 5))
//print(solution(3, 51, 75))
//print(solution(2, 10, 15))

//print(solution(4, 30, 118)) //39
print(solution(3, 1, 125)) // 64
//print(solution(4, 27, 68)) // 15
