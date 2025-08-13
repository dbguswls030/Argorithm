//
//  main.swift
//  13334
//
//  Created by 유현진 on 8/13/25.
//

import Foundation

struct MinHeap {
    private var node: [Int] = []

    mutating func push(_ value: Int) {
        node.append(value)
        var i = node.count - 1 // 노드의 마지막 인덱스

        while i > 0 && node[i] < node[(i-1)/2] { // 현재 노드가 부모 노드보다 작을 때
            node.swapAt(i, (i-1)/2)
            i = (i-1)/2
        }
    }

    mutating func pop() {
        guard !node.isEmpty else { return }

        node[0] = node.last!
        node.removeLast()

        var i = 0
        while true {
            var swapIndex = i
            let left = i * 2 + 1
            let right = i * 2 + 2

            if left < node.count && node[left] < node[swapIndex] {
                swapIndex = left
            }

            if right < node.count && node[right] < node[swapIndex] {
                swapIndex = right
            }

            if swapIndex == i { break }
            node.swapAt(i, swapIndex)
            i = swapIndex
        }
    }

    var peek: Int? {
        node[0]
    }

    var isEmpty: Bool {
        node.isEmpty
    }

    var numberOfElements: Int {
        node.count
    }
}
func solution() {
    let N = Int(readLine()!)!
    var priorityQueue = MinHeap()
    var temps = [[Int]]()
    var people = [[Int]]()
    var result = 0
    for _ in 0..<N {
        temps.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }

    let d = Int(readLine()!)!

    for temp in temps {
        let h = temp[0]
        let o = temp[1]
        if abs(h-o) <= d { // 집-사무실 거리가 선로보다 긴 사람들은 배제
            people.append([min(h,o), max(h,o)])

        }
    }

    people.sort { $0[1] < $1[1] } // 끝점을 기준으로 오름차순 정렬

    for person in people {
        let h = person[0]
        let o = person[1]
        let currentEnd = o
        let currentStart = currentEnd - d

        priorityQueue.push(h)

        while !priorityQueue.isEmpty && priorityQueue.peek! < currentStart {
            priorityQueue.pop()
        }

        result = max(result, priorityQueue.numberOfElements)
    }
    print(result)
}
solution()
