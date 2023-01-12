//
//  main.swift
//  최소직사각형
//
//  Created by 유현진 on 2023/01/12.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var sizes = sizes
    var left = 0
    var right = 0
    for index in 0..<sizes.count {
        if sizes[index][0] < sizes[index][1]{
            let temp = sizes[index][0]
            sizes[index][0] = sizes[index][1]
            sizes[index][1] = temp
        }
        if left < sizes[index][0] {left = sizes[index][0]}
        if right < sizes[index][1] {right = sizes[index][1]}
    }
    
    return left * right
}
print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]))
