//
//  main.swift
//  힙(최소힙, 최대힙)
//
//  Created by 유현진 on 2023/10/05.
//

import Foundation

func maxHeap(){
    var maxHeap = [Int]()
    maxHeap.append(0)
    
    func maxPush(_ n: Int){
        maxHeap.append(n)
        maxSort()
    }
    
    func maxSort(){
        var index = maxHeap.count - 1
        
        while index > 1{
            if maxHeap[index] > maxHeap[index/2]{
                maxSwap(a: index, b: index/2)
            }else{
                break
            }
            index /= 2
        }
    }
    
    func maxSwap(a: Int, b: Int){
        let temp = maxHeap[a]
        maxHeap[a] = maxHeap[b]
        maxHeap[b] = temp
    }
    
    func popMax(){
        var index = 1
        //        let temp = queue[index] // pop element
        maxHeap[index] = maxHeap.removeLast()
        while index * 2 + 1 < maxHeap.count {
            if maxHeap[index * 2] > maxHeap[index], maxHeap[index * 2] > maxHeap[index * 2 + 1]{
                maxSwap(a: index * 2, b: index)
                index *= 2
            }else if maxHeap[index * 2 + 1] > maxHeap[index], maxHeap[index * 2] < maxHeap[index * 2 + 1]{
                maxSwap(a: index * 2 + 1, b: index)
                index = index * 2 + 1
            }else{
                break
            }
        }
    }
    
    
    
    
        for e in [9,7,6,5,4,3,2,2,1,3]{
            maxPush(e)
            print(maxHeap)
        }
    
        popMax()
        print(maxHeap)

}


func minHeap(){
    var minHeap = [Int]()
    minHeap.append(0)
    func minSort(){
        var index = minHeap.count - 1
        
        while index > 1{
            if minHeap[index] < minHeap[index/2]{
                minSwap(a: index, b: index/2)
            }else{
                break
            }
            index /= 2
        }
    }
    
    func minPush(_ n: Int){
        minHeap.append(n)
        minSort()
    }
    func minSwap(a: Int, b: Int){
        let temp = minHeap[a]
        minHeap[a] = minHeap[b]
        minHeap[b] = temp
    }
    func popMin(){
        var index = 1
        
        minHeap[index] = minHeap.removeLast()
        
        while index * 2 + 1 < minHeap.count{
            if minHeap[index] > minHeap[index * 2], minHeap[index * 2] < minHeap[index * 2 + 1]{
                minSwap(a: index, b: index*2)
                index *= 2
            }else if minHeap[index] > minHeap[index * 2 + 1], minHeap[index * 2] > minHeap[index * 2 + 1]{
                minSwap(a: index, b: index*2+1)
                index = index * 2 + 1
            }else{
                break
            }
        }
    }
    
    
    for e in [9,7,6,5,4,3,2,2,1,3]{
        minPush(e)
        print(minHeap)
    }
    
    popMin()
    print(minHeap)
}
