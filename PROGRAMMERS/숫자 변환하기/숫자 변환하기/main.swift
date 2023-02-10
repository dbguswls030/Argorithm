//
//  main.swift
//  숫자 변환하기
//
//  Created by 유현진 on 2023/02/09.
//

import Foundation
//func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
//    var count =  1000000
//    var visited = Array(repeating: 0, count: 1000000 + 1)
//    var queue = [Int]()
//    func calc(v: Int, d: Int){
//        if x == y { count = 0; return }
//        print(v)
//        visited[v] = 1
//        if v > y { return }
//        if v == y {
//            if count > d { print("!");count = d }
//            return
//        }
//        if v*3 <= y, d < count{ calc(v: v*3, d: d+1) }
//        if v*2 <= y, d < count{ calc(v: v*2, d: d+1) }
//        if v+n <= y, d < count{ calc(v: v+n, d: d+1) }
//    }
//
//    visited[x] = 1
//    calc(v: x, d: 0)
//    return count == 1000000 ? -1 : count
//}
func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    if x == y { return 0 }
    var visited = Array(repeating: 0, count: 1000000 + 1)
    var queue = [x]
    var count = 0
    func bfs() -> Int{
        visited[x] = 1
        while !queue.isEmpty{
            
            queue.sort(by: <)
            let q = queue.removeFirst()
            
//            print(q)
            let mul3 = q*3
            let mul2 = q*2
            let addN = q+n
            
            if mul3 == y || mul2 == y || addN == y{
//                print("mul3,mul2,addN, count = \(mul3),\(mul2),\(addN), \(count)")
                return count == 0 ? 1 : count
            }
            
            if mul3 < y, visited[mul3] == 0{ queue.append(mul3); visited[mul3] = 1 }
            if mul2 < y, visited[mul2] == 0{ queue.append(mul2); visited[mul2] = 1 }
            if addN < y, visited[addN] == 0{ queue.append(addN); visited[addN] = 1 }
            count += 1
        }
        return -1
    }
    return bfs()
}

print(solution(10, 40, 5))
print(solution(10, 40, 30))
print(solution(2, 5, 4))
