//
//  main.swift
//  전력망 둘로 나누기
//
//  Created by 유현진 on 2023/04/05.
//

import Foundation

//func solution(_ n:Int, _ wires:[[Int]]) -> Int {
//    var tree = Array(repeating: [Int](), count: n+1)
//    var visited = Array(repeating: false, count: n+1)
//    var stack = [Int]()
//    var count = 1
//    var result = 100
//    func makeTree(){
//        for wire in wires {
//            let a = wire[0]
//            let b = wire[1]
//            tree[a].append(b)
//            tree[b].append(a)
//        }
//    }
//    makeTree()
//    
//    func dfs(){
//        while !stack.isEmpty{
//            let start = stack.removeLast()
//            for end in tree[start]{
//                if visited[end] == false{
//                    stack.append(end)
//                    visited[end] = true
//                    count += 1
//                    dfs()
//                }
//            }
//        }
//    }
//        
//    for wire in wires {
//        let a = wire[0]
//        let b = wire[1]
//        visited[a] = true
//        visited[b] = true
//        
//        stack.append(a)
//        dfs()
//        let left = count
//        count = 1
//        
//        stack.append(b)
//        dfs()
//        let right = count
//        
//        count = 1
//        
//        result = min(result, abs(left-right))
//        visited = Array(repeating: false, count: n+1)
//    }
//    return result
//}


func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var map = Array(repeating: [Int](), count: n)
    var result = Int.max
    for wire in wires {
        let a = wire[0]-1
        let b = wire[1]-1
        map[a].append(b)
        map[b].append(a)
    }

    
    func bfs(queue: [Int], visited: [Bool], count: Int) -> Int{
        var count = count
        var queue = queue
        var visited = visited
        while !queue.isEmpty{
            var newQueue = [Int]()
            for q in queue{
                for i in map[q]{
                    if visited[i] == false{
                        visited[i] = true
                        count += 1
                        newQueue.append(i)
                    }
                }
            }
            queue = newQueue
        }
        return count
    }
    
    for wire in wires {
        var visited = Array(repeating: false, count: n)
        visited[wire[0]-1] = true
        visited[wire[1]-1] = true
        let node = bfs(queue: [wire[0]-1], visited: visited, count: 1)
//        print(wire, n, node)
        result = min(abs((n - node) - node), result)
    }
    return result
}

//print(solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])) // 3
//print(solution(4, [[1,2],[2,3],[3,4]])) // 0
//print(solution(7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]])) // 1
print(solution(12, [[1, 5], [2, 5], [3, 6], [3, 7], [3, 12], [4, 5], [4, 7], [4, 10], [8, 9], [9, 10], [11, 12]])) // 2
