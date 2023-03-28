//
//  main.swift
//  가장 먼 노드
//
//  Created by 유현진 on 2023/03/28.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var v = Array(repeating: [Int](), count: n+1)
    var visited = Array(repeating: 0, count: n+1)
    var dept = 0
    var queue = [1]
    func bfs(q: [Int]){
        queue.removeAll()
        for start in q{
            for i in v[start]{
                if visited[i] == 0{
                    queue.append(i)
                    visited[i] = dept
                }
            }
            v[start].removeAll()
        }
    }
    for e in edge{
        let a = e[0]
        let b = e[1]
        v[a].append(b)
        v[b].append(a)
    }
    
    visited[1] = -1
    while !queue.isEmpty{
        dept += 1
        bfs(q: queue)
    }
    
    return visited.filter{dept - 1 == $0}.count
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
