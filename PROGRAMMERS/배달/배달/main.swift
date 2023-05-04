//
//  main.swift
//  배달
//
//  Created by 유현진 on 2023/05/04.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var d = Array(repeating: 500001, count: N+1)
    d[1] = 0
    var map = Array(repeating: Array(repeating: 500001, count: N+1), count: N+1)
    for r in road{
        let s = r[0]
        let e = r[1]
        let len = r[2]
        map[s][e] = min(len, map[s][e])
        map[e][s] = min(len, map[e][s])
    }
    var queue = [1]
    
    while !queue.isEmpty {
        let s = queue.removeFirst()
        for e in 1...N{
            if map[e][s] == 500001{
                continue
            }
            if d[e] > map[s][e] + d[s], map[s][e] != 500001{
                d[e] = map[s][e] + d[s]
                queue.append(e)
            }
            
        }
    }
    for i in 1...N{
        if d[i] <= k{
            answer += 1
        }
    }
    return answer
}

print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,4,2],[5,3,1]], 3))
print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[5,3,1]], 3))
print(solution(5, [[1,2,2],[2,3,3],[5,2,2],[5,3,1],[4,1,2],[4,2,2],[4,3,2],[1,4,1]], 4))
print(solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4))
