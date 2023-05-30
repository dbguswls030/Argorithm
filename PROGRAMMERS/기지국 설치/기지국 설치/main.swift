//
//  main.swift
//  기지국 설치
//
//  Created by 유현진 on 2023/05/30.
//

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    if w == 0{
        return n - stations.count
    }
    var answer = 0
    var left = 1
    for station in stations {
        let cur = station - w
//        print(" left : \(left), cur : \(cur)")
//        print(Float((cur - left)) / Float((1 + w + w)))
        answer += Int(ceil(Float((cur - left)) / Float((1 + w + w))))
        left = station + w + 1
    }
    if left <= n{
        if n - left == 0{
            answer += Int(ceil(Float((1)) / Float((1 + w + w))))
        }else{
            answer += Int(ceil(Float((n-left)) / Float((1 + w + w))))
        }
    }
    return answer
}


//print(solution(11, [4, 11], 1))
//print(solution(16, [9], 2))
//print(solution(11, [6], 0   ))
print(solution(13, [3, 7, 11], 1))
