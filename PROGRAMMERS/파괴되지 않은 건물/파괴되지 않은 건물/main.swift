//
//  main.swift
//  파괴되지 않은 건물
//
//  Created by 유현진 on 2023/05/25.
//

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var board = board
    var temp = Array(repeating: Array(repeating: 0, count: board[0].count+1), count: board.count+1)
    var result = 0
    for s in skill{
        let type = s[0]
        let r1 = s[1]
        let c1 = s[2]
        let r2 = s[3]
        let c2 = s[4]
        var degree = s[5]
        if type == 2{
            degree = degree * -1
        }
        temp[r1][c1] -= degree // 좌상
        temp[r1][c2+1] += degree // 우상
        temp[r2+1][c1] += degree // 좌하
        temp[r2+1][c2+1] -= degree // 우하
    }
    
    
    for i in 0..<board.count{
        for j in 1..<board[0].count{
            temp[i][j] += temp[i][j-1]
        }
    }
    for j in 0..<board[0].count{
        for i in 1..<board.count{
            temp[i][j] += temp[i-1][j]
        }
    }
    for i in 0..<board.count{
        for j in 0..<board[i].count{
            board[i][j] += temp[i][j]
            if board[i][j] > 0 {
                result += 1
            }
        }
    }
    return result
}

print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
