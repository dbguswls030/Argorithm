//
//  main.swift
//  부대복귀
//
//  Created by 유현진 on 2023/05/18.
//

import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var map = Array(repeating: [Int](), count: n+1)
    var visited = Array(repeating: true, count: n+1)
    var dis = Array(repeating: -1, count: n+1)
    for road in roads {
        let a = road[0]
        let b = road[1]
        map[a].append(b)
        map[b].append(a)
    }
    
    var queue = [destination]
    visited[destination] = false
    dis[destination] = 0
    
    while !queue.isEmpty{
        let start = queue.removeFirst()
        for i in map[start]{
            if visited[i] == true{
                queue.append(i)
                visited[i] = false
                dis[i] = dis[start] + 1
            }
        }
    }
    var answer = [Int]()
    for source in sources {
        answer.append(dis[source])
    }
    return answer
}
print(solution(3, [[1, 2], [2, 3]], [2, 3], 1))

print(solution(5, [[1, 2], [1, 4], [2, 4], [2, 5], [4, 5]], [1, 3, 5], 5))
