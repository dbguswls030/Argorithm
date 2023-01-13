//
//  main.swift
//  카펫
//
//  Created by 유현진 on 2023/01/13.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    var com = [[Int]]()
    for i in 3...sum/3{
        if sum % i == 0 {
            let w = sum / i
            let h = i
            if h>w{break}
            com.append([w,h])
        }
    }
    for i in com{
        let w = i[0]
        let h = i[1]
        if (w-2)*(h-2) == yellow{
            return [w,h]
        }
    }
    
    return []
}
print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))

