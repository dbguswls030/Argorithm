//
//  main.swift
//  가장 큰 수
//
//  Created by 유현진 on 2023/05/11.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    var numbers = numbers.sorted{Int("\($0)\($1)")! > Int("\($1)\($0)")!}
    var result = ""
    for number in numbers {
        result += String(number)
    }
    if numbers.first == 0{
        return "0"
    }
    return result
}

print(solution([6, 10, 2]))
print(solution([3, 30, 34, 5, 9]))
