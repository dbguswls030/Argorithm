//
//  main.swift
//  1374
//
//  Created by 유현진 on 11/15/24.
//

import Foundation
struct MinHeap<T: Comparable> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let removedValue = elements.removeLast()
        siftDown(from: 0)
        return removedValue
    }
    
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && elements[parentIndex] > child {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        elements[childIndex] = child
    }
    
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        let count = elements.count
        let parent = elements[parentIndex]
        
        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var minIndex = parentIndex
            
            if leftChildIndex < count && elements[leftChildIndex] < elements[minIndex] {
                minIndex = leftChildIndex
            }
            if rightChildIndex < count && elements[rightChildIndex] < elements[minIndex] {
                minIndex = rightChildIndex
            }
            if minIndex == parentIndex { return }
            
            elements[parentIndex] = elements[minIndex]
            parentIndex = minIndex
        }
        elements[parentIndex] = parent
    }
}
struct PriorityQueue<T: Comparable> {
    private var heap = MinHeap<T>()
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    mutating func peek() -> T?{
        return heap.peek()
    }
}
//func solution(){
//    var lectures = [[Int]]()
//    var result = 0
//    var pq = PriorityQueue<Int>()
//    for _ in 0..<Int(readLine()!)!{
//        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//        lectures.append(input)
//        pq.enqueue(input[2])
//    }
//    
//    lectures.sort{ $0[1] < $1[1] }
//
//    for (offset, lecture) in lectures.enumerated() {
//        if offset == 0{
//            result += 1
//            continue
//        }
//        pq.enqueue(lecture[2])
//        let minVal = pq.peek()!
//        if minVal <= lecture[1]{
//            _ = pq.dequeue()
//        }else if minVal > lecture[1]{
//            result += 1
//        }
//        
//    }
//    print(result)
//}
func solution(){
    let N = Int(readLine()!)!
    var lectures = [[Int]]()
    var minList = [Int]()
    
    for _ in 0..<N{
        lectures.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    lectures.sort{ $0[1] < $1[1] }

    for lecture in lectures {
        var isBreak = false
        for i in 0..<minList.count{
            if minList[i] <= lecture[1]{
                minList[i] = lecture[2]
                isBreak = true
                break
            }
        }
        if !isBreak{
            minList.append(lecture[2])
        }
    }
    print(minList.count)
}
solution()
