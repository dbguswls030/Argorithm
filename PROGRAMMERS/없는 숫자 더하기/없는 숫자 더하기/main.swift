//
//  main.swift
//  없는 숫자 더하기
//
//  Created by 유현진 on 2023/01/19.
//

import Foundation
//func solution(_ numbers:[Int]) -> Int {
//    var arr = [0,1,2,3,4,5,6,7,8,9]
//    var result = [Int]()
//    for num in arr {
//        if !numbers.contains(num){
//            result.append(num)
//        }
//    }
//    return result.reduce(0) {$0 + $1}
//}
func solution(_ numbers:[Int]) -> Int {
    var arr = [0,1,2,3,4,5,6,7,8,9]
    return arr.filter{!numbers.contains($0)}.reduce(0) { $0 + $1 }
}
print(solution([1,2,3,4,6,7,8,0]    ))
print(solution([5,8,4,0,6,7,9]  ))
