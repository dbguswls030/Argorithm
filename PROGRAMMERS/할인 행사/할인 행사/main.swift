//
//  main.swift
//  할인 행사
//
//  Created by 유현진 on 2023/03/24.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    for offset in 0...discount.count - 10{
        var number = number
        for item in discount[offset..<offset+10]{
            if let index = want.firstIndex(of: item){
                number[index] -= 1
            }
        }
        if number.filter({$0 > 0}).isEmpty{ result += 1 }
    }
    return result
}

print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
