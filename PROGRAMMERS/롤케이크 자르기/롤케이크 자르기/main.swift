//
//  main.swift
//  롤케이크 자르기
//
//  Created by 유현진 on 2023/01/04.
//

import Foundation
// 토핑의 가짓 수를 똑같이 나누는 것이 핵심
//func solution(_ topping:[Int]) -> Int {
//
//    func setable(arr: ArraySlice<Int>) -> Int{
//        var count = 0
//        var set = [Int]()
//        for i in arr{
//            if !set.contains(i){
//                set.append(i)
//                count += 1
//            }
//        }
//        return count
//    }
//
//    var count = 0
//    for index in 0..<topping.count{
//        if setable(arr: topping[0...index]) == setable(arr: topping[index+1..<topping.count]) {
//            count += 1
//        }
//    }
//    return count
//}
func solution(_ topping:[Int]) -> Int {
    var count = 0
    var s1: Set<Int> = []
    var s2 = Set(topping)
    var visited = Array(repeating: 0, count: topping.max()!+1)
    for i in topping{
        visited[i] += 1
    }
    for i in topping{
        s1.insert(i)
        visited[i] -= 1
        if visited[i] <= 0{
            s2.remove(i)
        }
        if s1.count == s2.count {
            count += 1
        }
    }
    return count
}

print(solution([1, 2, 1, 3, 1, 4, 1, 2]))
print(solution([1, 2, 3, 1, 4]))
print(solution([1,1,1,1,1]))
print(solution([1,2,3,4,5]))
