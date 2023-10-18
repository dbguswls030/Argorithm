//
//  main.swift
//  섬 연결하기
//
//  Created by 유현진 on 2023/10/07.
//

import Foundation

//func solution(_ n:Int, _ costs:[[Int]]) -> Int {
//    var map = Array(repeating: [(Int, Int)](), count: n)
//    var result = 0
//
//    let costs = costs.sorted{$0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]}
//    print(costs)
//
//    for cost in costs{
//        map[cost[0]].append((cost[1],cost[2]))
//        map[cost[1]].append((cost[0],cost[2]))
//    }
//    map.forEach {print($0)}
//
//    var visited = Array(repeating: [Int](), count: n)
//
//    for start in 0..<n{
//        var minValue = Int.max
//        var minIndex = 0
//
//        for i in map[start]{
//            let d = i.0
//            let v = i.1
//
//            if minValue > v, !visited[d].contains(start){
//                minIndex = d
//                minValue = v
//            }
//        }
//        print("minValue= \(minValue), (\(start), \(minIndex))")
//        if minValue != Int.max, visited[start].isEmpty{
//            visited[start].append(minIndex)
//            visited[minIndex].append(start)
//            result += minValue
//        }
//        print(result)
////        if 0 == visited.filter{$0.isEmpty}.count{ break }
//    }
//    return result
//}
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result = 0
    let costs = costs.sorted{$0[2] < $1[2]}
    var union = [Int]()
    for i in 0..<n{
        union.append(i)
    }
    
    func find(i: Int) -> Int{
        if i == union[i]{
            return union[i]
        }else{
            return find(i: union[i])
        }
    }
    
    func isValidUnion(a: Int, b: Int) -> Bool{
        let aa = find(i: a)
        let bb = find(i: b)
        
        if aa != bb{
            if aa < bb{
                union[bb] = aa
            }else{
                union[aa] = bb
            }
            
            return true
        }else {
            return false
        }
    }
    
    for i in 0..<costs.count {
        let cost = costs[i]
//        let start = min(cost[0],cost[1])
        let start = cost[0]
//        let end = max(cost[0],cost[1])
        let end = cost[1]
        let value = cost[2]
        
        
        if isValidUnion(a: start, b: end){
            result += value
        }
    }
    return result
}
print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])) // 4
print(solution(4, [[0, 1, 5], [1, 2, 3], [2, 3, 3], [3, 1, 2], [3, 0, 4]])) // 9
print(solution(5,  [[0,1,5],[1,2,3],[2,3,3],[3,1,2],[3,0,4],[2,4,6],[4,0,7]])) // 15
print(solution(5, [[0, 1, 1], [3, 1, 1], [0, 2, 2], [0, 3, 2], [0, 4, 100]])) // 104
print(solution(5, [[0, 1, 1], [3, 4, 1], [1, 2, 2], [2, 3, 4]])) // 8
//5 [[0, 1, 5], [1, 2, 3], [2, 3, 3], [3, 1, 2], [3, 0, 4], [2, 4, 6], [4, 0, 7]] 15
//5 [[0, 1, 1], [3, 4, 1], [1, 2, 2], [2, 3, 4]] 8
//4 [[0, 1, 5], [1, 2, 3], [2, 3, 3], [1, 3, 2], [0, 3, 4]] 9
//5 [[0, 1, 1], [3, 1, 1], [0, 2, 2], [0, 3, 2], [0, 4, 100]] 104
//6 [[0, 1, 5], [0, 3, 2], [0, 4, 3], [1, 4, 1], [3, 4, 10], [1, 2, 2], [2, 5, 3], [4, 5, 4]] 11
//5 [[0, 1, 1], [2, 3, 1], [3, 4, 2], [1, 2, 2], [0, 4, 100]] 6
//5 [[0, 1, 1], [0, 4, 5], [2, 4, 1], [2, 3, 1], [3, 4, 1]] 8
//5 [[0, 1, 1], [0, 2, 2], [0, 3, 3], [0, 4, 4], [1, 3, 1]] 8
