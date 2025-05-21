//
//  main.swift
//  1927
//
//  Created by 유현진 on 5/20/25.
//

import Foundation

struct Heap {
    var node: [Int] = []
    
    mutating func push(_ value: Int) {
        node.append(value)
        var i = node.count - 1
        
        while i > 0 && node[i] < node[(i-1)/2] {
            node.swapAt(i, (i-1)/2)
            i = (i-1)/2
        }
    }
    
    mutating func pop() {
        guard !node.isEmpty else {
            print(0)
            return
        }
        print(node[0])
        node[0] = node.last!
        node.removeLast()
        
        var i = 0
        while true {
            var minIndex = i
            let left = i * 2 + 1
            let right = i * 2 + 2
            
            if left < node.count && node[left] < node[minIndex] {
                minIndex = left
            }
            
            if right < node.count && node[right] < node[minIndex] {
                minIndex = right
            }
            
            if minIndex == i { break }
            node.swapAt(i, minIndex)
            i = minIndex
        }
    }
}

func solution() {
    let N = Int(readLine()!)!
    var orders = [Int]()
    var minHeap = Heap()
    for _ in 0..<N {
        orders.append(Int(readLine()!)!)
    }
    
    for order in orders {
        if order == 0 {
            minHeap.pop()
        } else {
            minHeap.push(order)
        }
    }
}

solution()
