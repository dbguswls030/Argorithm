//
//  main.swift
//  15686
//
//  Created by 유현진 on 2/17/25.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    var map = [[Int]]()
    for _ in 0..<N{
        map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    var chicken = [(Int, Int)]()
    var house = [(Int, Int)]()
    
    for i in 0..<N{
        for j in 0..<N{
            if map[i][j] == 1{ // 집
                house.append((i,j))
            }else if map[i][j] == 2{ // 치킨집
                chicken.append((i,j))
            }
        }
    }
    
    var chickenEnable = [(Int,Int)]()
    var result = Int.max
    
    func chickenDistance() -> Int{
        var sum = 0
        for h in house{
            var minDistance = Int.max
            for c in chickenEnable{
                minDistance = min(minDistance, abs(h.0 - c.0) + abs(h.1 - c.1))
            }
            sum += minDistance
        }
        return sum
    }
    
    func dfs(index: Int){
        if M  == chickenEnable.count{
            result = min(chickenDistance(), result)
            return
        }
        for i in index..<chicken.count{
            chickenEnable.append(chicken[i])
            dfs(index: i+1)
            chickenEnable.removeLast()
        }
    }
    dfs(index: 0)
    print(result)
}
solution()
