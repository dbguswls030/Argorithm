//
//  main.swift
//  택배 배달과 수거하기
//
//  Created by 유현진 on 2023/07/05.
//

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var result: Int64 = 0
    var deliveries = deliveries
    var pickups = pickups
    var d = -1
    var p = -1
    
    func setCurIndex(){
        var index = n-1
        while d == -1 || p == -1{
            if deliveries[index] != 0, d == -1 {
                d = index
            }
            if pickups[index] != 0, p == -1{
                p = index
            }
            index -= 1
            if index < 0 {
                break
            }
        }
    }
    
    setCurIndex()
    
    while d >= 0 || p >= 0{
        if d >= p{
            result += Int64((d+1) * 2)
        }else{
            result += Int64((p+1) * 2)
        }

        var curBox = cap
        while d >= 0, curBox > 0{
            if deliveries[d] - curBox <= 0{
                curBox -= deliveries[d]
                deliveries[d] = 0
                d -= 1
            }else{
                deliveries[d] -= curBox
                curBox = 0
            }
        }
        curBox = cap
        while p >= 0, curBox > 0{
            if pickups[p] - curBox >= 0{
                pickups[p] -= curBox
                curBox = 0
            }else{
                curBox -= pickups[p]
                pickups[p] = 0
                p -= 1
            }
        }
        while d >= 0, deliveries[d] == 0{
            d -= 1
        }
        while p >= 0, pickups[p] == 0{
            p -= 1
        }
    }
    
    
    return result
}
print(solution(2, 2, [1,0], [1,0]))
print(solution(2, 2, [0,0], [0,0]))
print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))
print(solution(2, 7,     [1, 0, 2, 0, 1, 0, 2], [0, 2, 0, 1, 0, 2, 0]))
