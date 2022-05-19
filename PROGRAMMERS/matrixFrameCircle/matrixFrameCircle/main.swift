//
//  main.swift
//  matrixFrameCircle
//
//  Created by 유현진 on 2022/05/19.
//

import Foundation

//print(solution(6,6,[[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
print(solution(3,4,[[1, 1, 2, 2], [1, 2, 2, 3], [1, 3, 2, 4], [2, 3, 3, 4]]))
print(solution(3,5,[[1, 1, 2, 2], [2, 3, 3, 4], [1, 2, 3, 4], [1, 1, 3, 4], [2, 2, 3, 5]]))
//print(solution(3,3,[[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]))
print(solution(100,97,[[1,1,100,97]]))


func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var map = Array(repeating: Array(repeating: 0, count: columns+1), count: rows+1)
    var result = [Int]()
    
    // init
    for i in 1...rows{
        for j in 1...columns{
            map[i][j] = ((i-1) * columns + j)
        }
    }
    
    for query in queries{
        let x1 = query[0]
        let y1 = query[1]
        let x2 = query[2]
        let y2 = query[3]
        var i = x1
        var j = y1
        var min = 1000001
        var preVal = map[i][j]
        
        var plusFlag = true
        
        while true{
            let curVal = map[i][j]
            if min > curVal {
                min = curVal
            }
            map[i][j] = preVal
            preVal = curVal
            if plusFlag {
                if j < y2{
                    j += 1
                }else if i < x2{
                    i += 1
                }
            }else{
                if y1 < j {
                    j -= 1
                }else if x1 < i{
                    i -= 1
                }
            }
            if i == x2, j == y2 {
                plusFlag = false
            }
            if plusFlag == false, i == x1, j == y1{
                map[x1][y1] = preVal
                break
            }
        }
        result.append(min)
    }
    return result
}
