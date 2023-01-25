//
//  main.swift
//  섬의개수
//
//  Created by 유현진 on 2023/01/25.
//

import Foundation
func solution(){
    while true{
        func bfs(i: Int, j: Int){
            var queue = [(i,j)]
            visited[i][j] = 1
            let dx = [-1,0,1,1,1,0,-1,-1]
            let dy = [-1,-1,-1,0,1,1,1,0]
            
            while queue.count > 0 {
                let pop = queue.removeFirst()
                for index in 0..<dx.count{
                    if pop.0+dx[index] < 0 || pop.0+dx[index] >= h || pop.1+dy[index] < 0 || pop.1+dy[index] >= w {
                        continue
                    }
                    if map[pop.0+dx[index]][pop.1+dy[index]] == 1, visited[pop.0+dx[index]][pop.1+dy[index]] == 0{
                        queue.append((pop.0+dx[index],pop.1+dy[index]))
                        visited[pop.0+dx[index]][pop.1+dy[index]] = 1
                    }
                }
            }
        }
        var result = 0
        let input = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
        if input == [0,0] { return }
        let w = input[0]
        let h = input[1]
        
        var visited = Array(repeating: Array(repeating: 0, count: w), count: h)
        var map = [[Int]]()
        for _ in 0..<h{
            map.append(readLine()!.components(separatedBy: " ").map{Int(String($0))!})
        }
        
        for i in 0..<map.count{
            for j in 0..<map[i].count{
                if map[i][j] == 1, visited[i][j] == 0{
                    result += 1
                    bfs(i: i, j: j)
                }
            }
        }
        print(result)
    }
}

solution()
