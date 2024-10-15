//
//  main.swift
//  tetromino
//
//  Created by 유현진 on 10/14/24.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var map = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    for _ in 0..<N{
        map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    var result = 0
    for i in 0..<N{
        for j in 0..<M{
            visited[i][j] = true
            dfs(i: i, j: j, dept: 1, sumValue: map[i][j])
            visited[i][j] = false
            forT(i: i, j: j, sumValue: map[i][j])
        }
    }
    
    print(result)
    
    func dfs(i: Int, j: Int, dept: Int, sumValue: Int){
        if dept == 4{
            result = max(result, sumValue)
            return
        }
        
        for index in 0..<4{
            let x = i + dx[index]
            let y = j + dy[index]
            if x >= 0, x < N, y >= 0, y < M{
                if visited[x][y] == false{
                    visited[x][y] = true
                    dfs(i: x, j: y, dept: dept+1, sumValue: sumValue+map[x][y])
                    visited[x][y] = false
                }
            }
        }
    }
    
    func forT(i: Int, j: Int, sumValue: Int){
        var sumValue = sumValue
        var isVisitable = [false, false, false, false]
        var isVisitableCount = 0
        var sumList = [0,0,0,0]
        
        for index in 0..<4{
            let x = i + dx[index]
            let y = j + dy[index]
            if x >= 0, x < N, y >= 0, y < M{
                isVisitable[index] = true
                sumValue += map[x][y]
                isVisitableCount += 1
            }
            
        }
        if isVisitableCount == 3{
            result = max(sumValue, result)
            return
        }
        if isVisitableCount < 3{
            return
        }
        
        for index in 0..<4{
            if isVisitable[index] == true{
                let x = i + dx[index]
                let y = j + dy[index]
                sumList[index] = sumValue - map[x][y]
            }
        }
        result = max(sumList.max()!, result)
        return
    }
}

solution()
