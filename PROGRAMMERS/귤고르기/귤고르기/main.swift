//
//  main.swift
//  귤고르기
//
//  Created by 유현진 on 2023/03/20.
//


// 크기 별 갯수 저장
// 갯수가 많은 것부터 k에 빼주기

import Foundation


func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var orange = [Int:Int]()
    var result = 0
    var orangeCount = 0
    for i in tangerine{
        if orange[i] == nil{
            orange[i] = 1
        }else{
            orange[i] = orange[i]! + 1
        }
    }
    
    let sortOrange = orange.values.sorted{$0 > $1}

    for (index, count) in sortOrange.enumerated(){
        if orangeCount + count >= k{
            result += index + 1
            break
        }
        orangeCount += count
    }
    return result
}
//    [2, 2, 2, 1, 1]
//print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(solution(5, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(solution(4, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(solution(3, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(solution(2, [1, 3, 2, 5, 4, 5, 2, 3]))
print(solution(1, [1, 1, 1, 1, 2, 2, 2, 3, 3, 3]))
print(solution(2, [1, 1, 1, 1, 2, 2, 2, 3, 3, 3]))
print(solution(3, [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3]))
print(solution(4, [1, 1, 1, 1, 2, 2, 2, 3, 3, 3]))
