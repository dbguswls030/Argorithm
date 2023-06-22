//
//  main.swift
//  광물 캐기
//
//  Created by 유현진 on 2023/06/21.
//

import Foundation
func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var picks = picks
    var weightList = [(Int,Int)]()
    let picksCount = picks.reduce(0, +) * 5
    var minerals = minerals
    if picksCount < minerals.count{
        minerals = Array(minerals[0..<picksCount])
    }
    var result = 0
    func needStamine(mineral: String) -> Int{
        if mineral == "diamond"{
            return 25
        }else if mineral == "iron"{
            return 5
        }else{
            return 1
        }
    }
    func getPick() -> Int{
        for (offset, count) in picks.enumerated() {
            if count != 0 {
                return offset
            }
        }
        return -1
    }
    func pickPower(index: Int) -> Int{
        if index == 0 {
            return 25
        }else if index == 1{
            return 5
        }else{
            return 1
        }
    }
    
    
   
    var index = 0
    var count = 0
    while index < minerals.count, index < picksCount {
        var weight = 0
        for i in index..<index+5{
            if i > minerals.count - 1 || i > picksCount - 1 { break }
            weight += needStamine(mineral: minerals[i])
        }
        weightList.append((weight,count))
        index += 5
        count += 1
    }
    
    for (weight, offset) in weightList{
        let pick = getPick()
        picks[pick] -= 1
        let power = pickPower(index: pick)
        let i = offset * 5
        for mIndex in i..<i+5{
            if mIndex > minerals.count - 1 { break }
            let m = needStamine(mineral: minerals[mIndex])
            let stamina = m / power
            result += stamina == 0 ? 1 : stamina
        }
    }
    
    return result
}


//print(solution([1, 3, 2], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]))
//print(solution([0,1,1], ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"]))
print(solution([1, 1, 1], ["stone", "stone", "stone", "stone", "stone", "diamond", "diamond", "diamond", "diamond", "diamond", "stone", "stone", "stone", "stone", "stone"]))
