//
//  main.swift
//  30689
//
//  Created by 유현진 on 1/6/25.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    
    var map = [[String]]()
    var cost = [[Int]]()
    
    var stack = [(Int, Int)]()
    
    var result = 0
    
    for _ in 0..<N{
        map.append(readLine()!.map{String($0)})
    }
    
    for _ in 0..<N{
        cost.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    func dfs(x: Int, y: Int){
        let arrow = map[x][y]
        
        var nextX = x
        var nextY = y
        
        if arrow == "L"{
            nextY -= 1
        }else if arrow == "R"{
            nextY += 1
        }else if arrow == "U"{
            nextX -= 1
        }else{
            nextX += 1
        }
        
        if nextX >= 0, nextX < N, nextY >= 0, nextY < M {
            if visited[nextX][nextY] == false{
                visited[x][y] = true
                stack.append((nextX, nextY))
                dfs(x: nextX, y: nextY)
                stack.removeLast()
            }else{
                var minCost = Int.max
                for point in stack.reversed(){
                    minCost = min(minCost, cost[point.0][point.1])
                    if point.0 == nextX, point.1 == nextY{
                        result += minCost
                        break
                    }
                    
                }
                
            }
        }
    }
    
    for i in 0..<N{
        for j in 0..<M{
            if !visited[i][j]{
                stack.append((i,j))
                dfs(x: i, y: j)
                stack.removeLast()
            }
        }
    }
    print(result)
}
solution()

