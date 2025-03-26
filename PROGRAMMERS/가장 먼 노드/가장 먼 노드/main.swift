//
//  main.swift
//  가장 먼 노드
//
//  Created by 유현진 on 3/26/25.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var map = Array(repeating: [Int](), count: n)
    var visited = Array(repeating: false, count: n)
    var result = 0
    for e in edge{
        let start = e[0] - 1
        let end = e[1] - 1
        map[start].append(end)
        map[end].append(start)
    }
    
    func bfs(queue: [Int]){
        var queue = queue
        
        while !queue.isEmpty{
            var newQueue = [Int]()
            
            var nodeCount = 0
            for start in queue{
                for end in map[start]{
                    if visited[end] == false{
                        newQueue.append(end)
                        visited[end] = true
                        nodeCount += 1
                    }
                }
            }
            if newQueue.isEmpty{
                break
            }
            result = nodeCount
            queue = newQueue
        }
    }
    visited[0] = true
    bfs(queue: [0])
    return result
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 3)
print(solution(11, [[1, 2], [1, 3], [2, 4], [2, 5], [3, 5], [
      3, 6], [4, 8], [4, 9], [5, 9], [5, 10], [6, 10], [6, 11]]), 4)
print(solution(4, [[1, 2], [2, 3], [3, 4]]), 1)
print(solution(2, [[1, 2]]), 1)
print(solution(5, [[4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 2)
print(solution(4, [[1, 2], [1, 3], [2, 3], [2, 4], [3, 4]]), 1)
print(solution(4, [[1, 4], [1, 3], [2, 3], [2, 1]]), 3)
print(solution(4, [[3, 4], [1, 3], [2, 3], [2, 1]]), 1)
print(solution(4, [[4, 3], [1, 3], [2, 3]]), 2)
