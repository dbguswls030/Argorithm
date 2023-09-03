//
//  main.swift
//  땅따먹기
//
//  Created by 유현진 on 2023/09/03.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var land = land
    var index = 1
    while index < land.count{
        for i in 0..<4{
            var m = 0
            for j in 0..<4{
                if i != j {
                    m = max(m, land[index][i] + land[index-1][j])
                }
            }
            land[index][i] = m
        }
        
        index += 1
    }
    return land[land.count-1].max()!
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))

