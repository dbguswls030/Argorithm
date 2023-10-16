//
//  main.swift
//  스티커 모으기2
//
//  Created by 유현진 on 2023/09/18.
//

import Foundation

func solution(_ sticker:[Int]) -> Int{
    if sticker.count <= 3{
        return sticker.max()!
    }
    var dp1 = sticker
    dp1[sticker.count - 1] = 0
    
    var dp2 = sticker
    dp2[0] = 0

    for i in 1..<dp1.count{
        if i == 1{
            dp1[i] = max(dp1[i-1], dp1[i])
            dp2[i] = max(dp2[i-1], dp2[i])
        }else{
            dp1[i] = max(dp1[i-1], dp1[i] + dp1[i-2])
            dp2[i] = max(dp2[i-1], dp2[i] + dp2[i-2])
        }
    }
    return max(dp1[dp1.count-1], dp2[dp2.count-1])
}
print(solution([14, 6, 5, 11, 3, 9, 2, 10]))
print(solution([1, 3, 2, 5, 4]))
print(solution([1, 4, 2]))
