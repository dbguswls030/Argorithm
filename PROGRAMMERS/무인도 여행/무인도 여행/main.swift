//
//  main.swift
//  무인도 여행
//
//  Created by 유현진 on 2023/02/07.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    func bfs(i: Int, j: Int) -> Int{
        func search(x: Int, y: Int){
            let dx = [0,0,1,-1]
            let dy = [1,-1,0,0]
            for i in 0..<dx.count{
                let ddx = x + dx[i]
                let ddy = y + dy[i]
                
                if ddx >= 0, ddx < map.count, ddy >= 0, ddy < map[0].count{
                    if map[ddx][ddy] != "X", visited[ddx][ddy] == 0{
                        queue.append((ddx,ddy))
//                        print(ddx,ddy)
                        visited[ddx][ddy] = 1
                        food += Int(map[ddx][ddy])!
//                        print("food += \(Int(map[ddx][ddy])!)")
//                        print("food = \(food)")
                    }
                }
            }
        }
        var food = Int(map[i][j])!
        var queue = [(i,j)]
        visited[i][j] = 1
//        print(i,j)
        while !queue.isEmpty{
            let p = queue.removeFirst()
            search(x: p.0, y: p.1)
        }
        return food
    }
    
    var map = Array(repeating: [String](), count: maps.count)
    for i in 0..<maps.count{
        map[i] = maps[i].map({String($0)})
    }
    var visited = Array(repeating: Array(repeating: 0, count: map[0].count), count: map.count)
    var result = [Int]()
    
    
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] != "X", visited[i][j] == 0{
                result.append(bfs(i: i, j: j))
            }
        }
    }
//    print(map.forEach({print($0)}))
//    print(visited.forEach({print($0)}))
    return result.sorted(by: <).count == 0 ? [-1] : result.sorted(by: <)
}

print(solution(["X591X","X1X5X","X231X", "1XXX1"]))
print(solution(["XXX","XXX","XXX"]))
