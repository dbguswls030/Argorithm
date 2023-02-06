//
//  main.swift
//  안전 영역
//
//  Created by 유현진 on 2023/02/06.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var map = Array(repeating: [0], count: N + 1)
    var visited = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
    var maxHeight = 1
    var result = 0
    for i in 1...N{
        map[i].append(contentsOf: readLine()!.components(separatedBy: " ").map{Int(String($0))!})
        if let max = map[i].max(){
            if maxHeight < max { maxHeight = max}
        }
    }
    for height in 0..<maxHeight{
        var count = 0
        visited = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
        for i in 1...N{
            for j in 1...N{
                if map[i][j] > height, visited[i][j] == 0{
                    count += 1
                    bfs(i: i, j: j, height: height)
                }
            }
        }
        if result < count{
            result = count
        }
    }
    
    func bfs(i: Int, j: Int, height: Int){
        func search(x: Int, y: Int){
            let dx = [0, 0, 1, -1]
            let dy = [1, -1, 0, 0]
            for i in 0..<dx.count{
                let ddx = x + dx[i]
                let ddy = y + dy[i]
                if ddx > 0, ddx <= N, ddy > 0, ddy <= N{
                    if map[ddx][ddy] > height, visited[ddx][ddy] == 0{
                        queue.append((ddx, ddy))
                        visited[ddx][ddy] = 1
                    }
                }
                
            }
        }
        visited[i][j] = 1
        var queue = [(i,j)]
        
        while !queue.isEmpty{
            let p = queue.removeFirst()
            search(x: p.0, y: p.1)
        }
    }
    print(result)
}
solution()
