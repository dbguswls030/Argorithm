//
//  main.swift
//  요격 시스템
//
//  Created by 유현진 on 2023/06/20.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted{$0[1] < $1[1]}
    var end = 0
    var result = 0
    for target in targets {
        if end <= target[0] {
            result += 1
            end = target[1]
        }
    }
    return result
}
print(solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]))

