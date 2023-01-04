//
//  main.swift
//  푸드 파이터 대회
//
//  Created by 유현진 on 2023/01/04.
//

import Foundation
func solution(_ food:[Int]) -> String {
    var str = "0"
    for (index, count) in food[1..<food.count].reversed().enumerated(){
        for _ in 0..<count / 2{
            str.append("\(food.count - 1 - index)")
            let first = str.index(str.startIndex, offsetBy: 0)
            let char = Character(String(food.count-1-index)) 
            str.insert(char, at: first)
        }
    }
    return str
}

print(solution([1,3,4,6]))
print(solution([1,7,1,2]))
