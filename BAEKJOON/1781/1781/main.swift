//
//  main.swift
//  1781
//
//  Created by 유현진 on 5/19/25.
//

import Foundation

//func solution() {
//    let N = Int(readLine()!)!
//    var homeworks = [[UInt32]]()
//    for _ in 0..<N {
//        homeworks.append(readLine()!.split(separator: " ").map { UInt32($0)! })
//    }
//    
//    var result: UInt32 = 0
//
//    homeworks.sort {
//        if $0[0] == $1[0] {
//            return $0[1] > $1[1]
//        } else {
//            return $0[0] < $1[0]
//        }
//    }
//
//    func dfs(index: Int, time: Int, count: UInt32) {
//        if index >= homeworks.count {
//            result = max(result, count)
//            return
//        }
//    
//        if time < homeworks[index][0] {
//            dfs(index: index+1, time: time+1, count: count+homeworks[index][1])
//        }
//        dfs(index: index+1, time: time, count: count)
//    }
//    
//    dfs(index: 0, time: 0, count: 0)
//    print(result)
//}

struct Problem {
    let deadLine: Int
    let ramen: Int
}

func solution() {
    let N = Int(readLine()!)!
    var problems = [Problem]()
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        problems.append(.init(deadLine: input[0], ramen: input[1]))
    }
    
    var result: Int = 0

    problems.sort { $0.deadLine < $1.deadLine}
    
    var heap = [Int]()
    
    func push(_ value: Int) {
        heap.append(value)
        var i = heap.count - 1
        while i > 0 && heap[(i-1)/2] > heap[i] {
            heap.swapAt((i-1)/2, i)
            i = (i-1)/2
        }
    }
    
    func pop() {
        guard !heap.isEmpty else { return }
        heap[0] = heap.last!
        heap.removeLast()
        var i = 0
        while true {
            var minIndex = i
            let left = i * 2 + 1
            let right = i * 2 + 2
            if left < heap.count && heap[left] < heap[minIndex] {
                minIndex = left
            }
            if right < heap.count && heap[right] < heap[minIndex] {
                minIndex = right
            }
            if minIndex == i { break }
            heap.swapAt(i, minIndex)
            i = minIndex
        }
    }
    
    for problem in problems {
        push(problem.ramen)
        if heap.count > problem.deadLine {
            pop()
        }
    }
    print(heap.reduce(0, +))
}
solution()
