//
//  main.swift
//  등산코스 정하기
//
//  Created by 유현진 on 2023/05/31.
//

// 출발점에서 산봉우리에서 출발점까지 돌아오기
// 출발점과 연결된 노드만큼 dfs 호출
// 만약 다른 산봉우리와 다른 출발점 만나면 그냥 return
// 노드 움직일 떄마다 최대 intensity 저장
// 산봉우리 번호가 낮고 intensity가 최소가 되는 출발점, 산봉우리, 최소 intensity 출력

import Foundation

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var graph = Array(repeating: [(Int, Int)](), count: n+1)
    var intensity = Array(repeating: 10000001, count: n+1)
    var gates = Set(gates)
    var summits = Set(summits)
    var queue = [Int]()
    for path in paths {
        let i = path[0]
        let j = path[1]
        let w = path[2]
        if isGate(node: i, gates: gates) || isSummit(node: j, summits: summits){
            graph[i].append((j, w))
        }else if isGate(node: j, gates: gates) || isSummit(node: i, summits: summits){
            graph[j].append((i,w))
        }else{
            graph[i].append((j, w))
            graph[j].append((i,w))
        }
    }
    for gate in gates {
        queue.append(gate)
        intensity[gate] = 0
    }
    
    while !queue.isEmpty{
        let node = queue.removeFirst()
        for nnode in graph[node]{
            let m = max(intensity[node], nnode.1)
            if intensity[nnode.0] > m{
                intensity[nnode.0] = m
                queue.append((nnode.0))
            }
        }
    }
    
    var mNode = 10000001
    var mW = 10000001
    for summit in summits.sorted() {
        if intensity[summit] < mW{
            mNode = summit
            mW = intensity[summit]
        }
    }
    return [mNode, mW]
}
func isGate(node: Int, gates: Set<Int>) -> Bool{
    return gates.contains(node) ? true : false
}
func isSummit(node: Int, summits: Set<Int>)-> Bool{
    return summits.contains(node) ? true : false
}
print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2, 3, 4]))
print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3, 7], [1, 5]))
print(solution(5, [[1, 3, 10], [1, 4, 20], [2, 3, 4], [2, 4, 6], [3, 5, 20], [4, 5, 6]], [1,2], [5]))
