//
//  main.swift
//  k진수에서소수개수구하기
//
//  Created by 유현진 on 2023/03/21.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var nArr = String(n, radix: k).split(separator: "0").filter{$0 != "1"}.map{Int($0)!}
    var count = 0
    for num in nArr{
        var isEven = true
        if num < 4 {
            count += 1
            continue
        }
        for i in 2...Int(sqrt(Double(num))){
            if num % i == 0 {
                isEven = false
                break
            }
        }
        if isEven == true{ count += 1 }
    }
    return count
}

print(solution(437674, 3))
print(solution(110011, 10))
