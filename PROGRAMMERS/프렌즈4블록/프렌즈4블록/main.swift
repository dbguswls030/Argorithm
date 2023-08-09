//
//  main.swift
//  프렌즈4블록
//
//  Created by 유현진 on 2023/08/09.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var result = 0
    var map = [[String]]()
    var y = 0
    var x = 0
    let dx = [0,1,0,1]
    let dy = [0,0,1,1]
    for b in board{
        map.append(b.map{String($0)})
    }

    func moveBlock(xx: Int, yy: Int){
        if map[yy-1][xx] == ",", yy >= 2{
            moveBlock(xx: xx, yy: yy-1)
            
        }
        map[yy][xx] = map[yy-1][xx]
        map[yy-1][xx] = ","
    }
    
    func reloadMap(){
        for xx in 0..<n{
            for yy in (1..<m).reversed(){
                if map[yy][xx] == ","{
                    moveBlock(xx: xx, yy: yy)
                }
            }
        }
    }
    
    var equalBlocks = [(Int,Int)]()
    
    while true{
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        while y < m - 1{
            let cur = map[y][x]
            if cur == ","{
                x += 1
                if x / (n-1) == 1{
                    x %= (n-1)
                    y += 1
                }
                continue
            }
            var isEqualFlag = true
            var tempEqual = [(Int,Int)]()
            for i in 0..<dx.count{
                if cur != map[y+dy[i]][x+dx[i]]{
                    isEqualFlag = false
                    tempEqual.removeAll()
                    break
                }
                if visited[y+dy[i]][x+dx[i]] == false{
                    tempEqual.append((y+dy[i],x+dx[i]))
                }
            }

            if isEqualFlag{
                tempEqual.forEach{
                    visited[$0.0][$0.1] = true
                    equalBlocks.append($0)
                }
            }
            x += 1
            if x / (n-1) == 1{
                x %= (n-1)
                y += 1
            }
        }

        if equalBlocks.isEmpty{
            break
        }else{
            for equalBlock in equalBlocks {
                map[equalBlock.0][equalBlock.1] = ","
                result += 1
            }
            equalBlocks.removeAll()
            reloadMap()
            y = 0
            x = 0
        }
    }
    return result
}

print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
