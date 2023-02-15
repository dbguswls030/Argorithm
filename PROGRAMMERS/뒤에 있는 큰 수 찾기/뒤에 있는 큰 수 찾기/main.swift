//
//  main.swift
//  뒤에 있는 큰 수 찾기
//
//  Created by 유현진 on 2023/02/15.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Array(repeating: 0, count: numbers.count)
    var stack = [Int]()
    for (index, number) in numbers.enumerated() {
        while !stack.isEmpty, numbers[stack[stack.count-1]] < number{
            result[stack.removeLast()] = number
        }
        stack.append(index)
    }
    while !stack.isEmpty{
        result[stack.removeLast()] = -1
    }
    
    return result
}

print(solution([2, 3, 3, 5]))
print(solution([9, 1, 5, 3, 6, 2]))


//if let i = numbers[index+1..<numbers.endIndex].firstIndex(where: {$0 > number}){
//    result.append(numbers[i])
//}else{
//    result.append(-1)
//}

// 9 3 2 1 5
