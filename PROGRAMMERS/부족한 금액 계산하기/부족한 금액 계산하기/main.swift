//
//  main.swift
//  부족한 금액 계산하기
//
//  Created by 유현진 on 2023/02/07.
//

import Foundation

print("Hello, World!")

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = 0
    for i in 1...count{
        answer += Int64(price * i)
    }
    return answer >= money ? answer - Int64(money) : 0
}

print(solution(3, 20, 4))
