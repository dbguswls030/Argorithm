//
//  main.swift
//  2751
//
//  Created by 유현진 on 2021/10/13.
//

import Foundation

//func solution(){
//    let N = Int(readLine()!)!
//    var list = [Int]()
//    for _ in 0..<N{
//        list.append(Int(readLine()!)!)
//    }
//
//
//    divide(0, list.count-1)
//    for i in list{
          print(i)
      }
//
//    func divide(_ left: Int, _ right: Int){
//        if left < right{
//            let mid = (left + right) / 2
//            divide(left, mid)
//            divide(mid+1, right)
//            merge(left, mid, right)
//        }
//    }
//
//    func merge(_ left: Int, _ mid: Int, _ right: Int){
//        print(list)
//        var i = left
//        var j = mid+1
//        var k = left
//        var sortedList = Array(repeating: 0, count: list.count)
//        while i <= mid && j <= right{
//            if list[i] >= list[j]{
//                sortedList[k] = list[j]
//                k += 1
//                j += 1
//            }else{
//                sortedList[k] = list[i]
//                k += 1
//                i += 1
//            }
//        }
//        if i > mid{
//            for v in j...right{
//                sortedList[k] = list[v]
//                k += 1
//            }
//        }else{
//            for v in i...mid{
//                sortedList[k] = list[v]
//                k += 1
//            }
//        }
//        for v in left...right{
//            list[v] = sortedList[v]
//        }
//    }
//}
//solution()


func solution(){
    let N = Int(readLine()!)!
    var arr = [Int]()
    for _ in 0..<N{
        arr.append(Int(readLine()!)!)
    }
    
    for i in divide(arr){
        print(i)
    }
    
    
    func divide(_ list: [Int]) -> [Int]{
        if list.count > 1{
            let mid = list.count / 2
            let left = divide(Array(list[0..<mid]))
            let right = divide(Array(list[mid..<list.count]))
            return merge(left, right)
        }
        return list
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int]{
        var leftIndex = 0
        var rightIndex = 0
        var sorted = [Int]()
        while leftIndex < left.count && rightIndex < right.count{
            if left[leftIndex] > right[rightIndex]{
                sorted.append(right[rightIndex])
                rightIndex += 1
            }else{
                sorted.append(left[leftIndex])
                leftIndex += 1
            }
        }
        while leftIndex < left.count{
            sorted.append(left[leftIndex])
            leftIndex += 1
        }
        while rightIndex < right.count{
            sorted.append(right[rightIndex])
            rightIndex += 1
        }
        return sorted
    }
}
solution()
