//
//  main.swift
//  n^2배열자르기
//
//  Created by 유현진 on 2023/03/24.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var map = [Int]()
    for index in Int(left)...Int(right){
        let lv = index / n + 1
        let num = (index + 1) % n
        if num != 0 {
            num < lv ? map.append(lv) : map.append(num)
        }else{
            map.append(n)
        }
    }
    return map
}
print(solution(3, 2, 5))
print(solution(4, 7, 14))
