//
//  main.swift
//  완전탐색 모의고사
//
//  Created by 유현진 on 2023/01/17.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let given = [[1,2,3,4,5],
                 [2,1,2,3,2,4,2,5],
                 [3,3,1,1,2,2,4,4,5,5]]

    var countFirst = 0
    var countSecond = 0
    var countThird = 0
    
    for (index, answer) in answers.enumerated() {
        if given[0][index % given[0].count] == answer{
            countFirst += 1
        }
        if given[1][index % given[1].count] == answer{
            countSecond += 1
        }
        if given[2][index % given[2].count] == answer{
            countThird += 1
        }
    }
    var result = [Int]()
    let maxValue = max(countFirst, countSecond, countThird)
    if countFirst == maxValue {result.append(1)}
    if countSecond == maxValue {result.append(2)}
    if countThird == maxValue {result.append(3)}
    return result
}

print(solution([1,2,3,4,5]))
print(solution([1,3,2,4,2]))
