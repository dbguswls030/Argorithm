//
//  main.swift
//  햄버거 만들기
//
//  Created by 유현진 on 2023/01/06.
//

import Foundation
// 빵- 야채 - 고기 - 빵
// 1 - 빵 2 - 야채 3 - 고기

//func solution(_ ingredient:[Int]) -> Int {
//    var value = ingredient
//    var count = 0
//    while value.count >= 4{
//        if let range = value.firstRange(of: [1,2,3,1]){
//            value.removeSubrange(range)
//            count += 1
//        }else{
//            break
//        }
//    }
//    return count
//}
func solution(_ ingredient:[Int]) -> Int {
    var value = ingredient
    var count = 0
    var top = 0
    while top <= value.count - 4{
        if top < 0{
            top = 0
        }
        if value[top...top+3] == [1,2,3,1]{
            count += 1
            value.removeSubrange(top...top+3)
            top -= 3
        }else{
            top += 1
        }
    }
    return count
}

print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))
print(solution([1, 3, 2, 1, 2, 1, 3, 1, 2]))
print(solution([1, 1, 2, 1, 2, 3, 1, 3, 1, 2, 3, 1]))
print(solution([1, 1, 2, 3, 1, 2, 3, 1, 1, 2, 3, 1]))
