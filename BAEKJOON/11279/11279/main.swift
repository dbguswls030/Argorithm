//
//  main.swift
//  11279
//
//  Created by 유현진 on 5/20/25.
//

import Foundation

struct Node {
    let value: Int
}

func solution() {
    let N = Int(readLine()!)!
    var operators: [Int] = []
    for _ in 0..<N {
        operators.append(Int(readLine()!)!)
    }
    
    var heap: [Int] = []
    
    func push(_ value: Int) {
        heap.append(value)
        var i = heap.count - 1
        
        while i > 0 && heap[(i-1)/2] < heap[i] {
            heap.swapAt((i-1)/2, i)
            i = (i-1)/2
        }
    }
    
    func pop() {
        guard !heap.isEmpty else {
            print(0)
            return
        }
        print(heap[0])
        heap[0] = heap.last!
        heap.removeLast()
        var i = 0
        while true {
            var maxIndex = i
            let left = i * 2 + 1
            let right = i * 2 + 2
            
            if left < heap.count && heap[left] > heap[maxIndex] {
                maxIndex = left
            }
            
            if right < heap.count && heap[right] > heap[maxIndex] {
                maxIndex = right
            }
            
            if maxIndex == i { break }
            
            heap.swapAt(i, maxIndex)
            i = maxIndex
            
        }
    }
    
    for op in operators {
        if op == 0 {
            pop()
        } else {
            push(op)
        }
    }
}

solution()
