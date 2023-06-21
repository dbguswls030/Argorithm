//
//  main.swift
//  연속된 부분 수열의 합
//
//  Created by 유현진 on 2023/06/20.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var left = 0
    var right = 0
    var num = sequence[0]
    var min = 10000001
    var result = [Int]()
    
    while true{
        if num == k {
            if left == right{
                return [left, right]
            }
            if min > abs(left-right){
                min = abs(left-right)
                result = [left, right]
            }
            if right < sequence.count - 1{
                right += 1
                num += sequence[right]
            }else{
                num -= sequence[left]
                left += 1
            }
        }else if num > k, left < sequence.count - 1{
            num -= sequence[left]
            left += 1
        }else if num < k, right < sequence.count - 1{
            right += 1
            num += sequence[right]
        }else{
            break
        }
    }
    return result
}

print(solution([1, 2, 3, 4, 5], 7))
print(solution([1, 1, 1, 2, 3, 4, 5], 5))
print(solution([2, 2, 2, 2, 2], 6))
