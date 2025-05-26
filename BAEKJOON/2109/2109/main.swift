//
//  main.swift
//  2109
//
//  Created by 유현진 on 5/26/25.
//

import Foundation

struct Lecture {
    let date: Int
    let pay: Int
}

struct MinHeap {
    var heap: [Int]
    
    mutating func push(value: Int) {
        heap.append(value)
        
        var i = heap.count - 1
        while i > 0 && heap[i] < heap[(i-1)/2] {
            heap.swapAt(i, (i-1)/2)
            i = (i-1)/2
        }
    }
    
    mutating func pop() {
        guard !heap.isEmpty else { return }
        
        heap[0] = heap.last!
        heap.removeLast()
        
        var i = 0
        
        while true {
            var minIndex = i
            let leftIndex = i * 2 + 1
            let rightIndex = i * 2 + 2
            
            if leftIndex < heap.count && heap[minIndex] > heap[leftIndex] {
                minIndex = leftIndex
            }
            
            if rightIndex < heap.count && heap[minIndex] > heap[rightIndex] {
                minIndex = rightIndex
            }
            
            if i == minIndex {
                break
            }
            heap.swapAt(i, minIndex)
            i = minIndex
        }
    }
}

func solution() {
    let N = Int(readLine()!)!
    var lectures = [Lecture]()
    var minHeap = MinHeap(heap: [])
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        lectures.append(Lecture(date: input[1], pay: input[0]))
    }
    
    lectures.sort { $0.date < $1.date }
    
    for lecture in lectures {
        minHeap.push(value: lecture.pay)
        if minHeap.heap.count > lecture.date {
            minHeap.pop()
        }
    }
    print(minHeap.heap.reduce(0, +))
}

solution()
