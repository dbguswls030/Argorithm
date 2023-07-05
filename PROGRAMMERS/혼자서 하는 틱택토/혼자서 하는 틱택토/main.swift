//
//  main.swift
//  혼자서 하는 틱택토
//
//  Created by 유현진 on 2023/06/23.
//

import Foundation

func solution(_ board:[String]) -> Int {
    var map = [[String]]()
    map = board.map{$0.map{String($0)}}
    
    func whoWin(c: String) -> Bool{
        let winIndex = [[(0,0), (0,1), (0,2)],
                        [(1,0), (1,1), (1,2)],
                        [(2,0), (2,1), (2,2)],
                        [(0,0), (1,1), (2,2)],
                        [(2,0), (1,1), (0,2)],
                        [(0,0), (1,0), (2,0)],
                        [(0,1), (1,1), (2,1)],
                        [(0,2), (1,2), (2,2)]]
        
        for indexList in winIndex {
            let first = indexList[0]
            let second = indexList[1]
            let third = indexList[2]
            if map[first.0][first.1] == c, map[second.0][second.1] == c, map[third.0][third.1] == c{
                return true
            }
        }
        return false
    }
    
    let oFlag = whoWin(c: "O")
    let xFlag = whoWin(c: "X")
    
    if oFlag == true, xFlag == true{
        return 0
    }
    func counting() -> Bool{
        var oCount = 0
        var xCount = 0
        
        for i in 0..<3{
            for j in 0..<3{
                if map[i][j] == "O"{
                    oCount += 1
                }else if map[i][j] == "X"{
                    xCount += 1
                }
            }
        }
        if oCount == 0, xCount == 0 {
            return true
        }
        if oCount < xCount {
            return false
        }
        if oCount > xCount + 1{
            return false
        }
        if oFlag == true, oCount - 1 != xCount{
            return false
        }
        if xFlag == true, oCount != xCount{
            return false
        }
        return true
    }
    return counting() == true ? 1 : 0
}

print(solution(["O.X", ".O.", "..X"]))
print(solution(["OOO", "...", "XXX"]))
print(solution(["...", ".X.", "..."]))
print(solution(["...", "...", "..."]))
print(solution(["OXO", "XOX", "OXO"]))

