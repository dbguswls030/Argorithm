//
//  main.swift
//  양과 늑대
//
//  Created by 유현진 on 2023/05/24.
//

import Foundation
//
func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var result = 0
    var map =  Array(repeating: [Int](), count: info.count)
    
    for edge in edges {
        map[edge[0]].append(edge[1])
    }
    
    func bfs(queue: [Int], s: Int, w: Int, visited: [Bool]){
        if w >= s{
            return
        }

        if result < s {
            result = s
        }
        if visited.filter({$0 == false}).count == 0{
            return
        }
        
        for node in queue{
            var s = s
            var w = w
            if info[node] == 1{
                w += 1
            }else{
                s += 1
            }
            var visited = visited
            visited[node] = true
            bfs(queue: queue.filter{$0 != node}+map[node], s: s, w: w, visited: visited)
        }
    }
    bfs(queue: map[0], s: 1, w: 0, visited: Array(repeating: false, count: info.count))
    return result
}
print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))

print(solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]))
