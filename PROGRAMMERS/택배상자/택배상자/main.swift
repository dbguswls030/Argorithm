//
//  main.swift
//  택배상자
//
//  Created by 유현진 on 2023/07/10.
//

import Foundation

//func solution(_ order:[Int]) -> Int {
//    var subStack = [Int]()
//    var result = 0
//    var order = order
//    var index = 1
//    let count = order.count
//    while !order.isEmpty{
////        print("*\(index)*")
////        print(order)
////        print(subStack)
//        if order.first == index{
//            result += 1
//            index += 1
//            order.removeFirst()
//        }else{
//            if order.first == subStack.last {
//                subStack.removeLast()
//                order.removeFirst()
//                result += 1
//            }else{
//                subStack.append(index)
//                index += 1
//            }
//        }
//
//        if index > count, index != order.first, subStack.last != order.first{
//            break
//        }
//    }
//    return result
//}
func solution(_ order:[Int]) -> Int {
    var subStack = [Int]()
    var result = 0
    var orderIndex = 0
    var index = 1
    let count = order.count
    while orderIndex < count{
//        print("*\(index)*")
//        print(order)
//        print(subStack)
        if index > count, index != order[orderIndex], subStack.last != order[orderIndex]{
            break
        }
        if order[orderIndex] == index{
            result += 1
            index += 1
            orderIndex += 1
        }else{
            if order[orderIndex] == subStack.last {
                subStack.removeLast()
                orderIndex += 1
                result += 1
            }else{
                subStack.append(index)
                index += 1
            }
        }

        
    }
    return result
}
print(solution([4, 3, 1, 2, 5]))
print(solution([5, 4, 3, 2, 1]))
print(solution([3, 5, 4, 2, 1]))
