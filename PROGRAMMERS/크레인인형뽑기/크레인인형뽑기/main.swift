//
//  main.swift
//  크레인인형뽑기
//
//  Created by 유현진 on 2021/06/22.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    
    for i in moves{
        for j in 0...board[i-1].count-1{
            if board[j][i-1] != 0{
                result.append(board[j][i-1])
                board[j][i-1]=0
                if result.count>=2{
                    resultCount()
                }
                break
            }
        }
    }
    return count
}

func resultCount(){
    if result[result.count-1] == result[result.count-2]{
        result.remove(at: result.count-1)
        result.remove(at: result.count-1)
        count+=2
    }
}
var count = 0
var result: Array<Int> = []



print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
