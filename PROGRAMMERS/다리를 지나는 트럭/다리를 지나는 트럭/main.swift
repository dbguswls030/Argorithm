//
//  main.swift
//  다리를 지나는 트럭
//
//  Created by 유현진 on 2023/07/31.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = [(Int,Int)]()
    var trucks = [(Int,Int)]()
    var result = 0
    var curWeight = 0
    for truck_weight in truck_weights {
        trucks.append((truck_weight,bridge_length))
    }
    
    repeat{
//        print(result, curWeight, bridge)
        result += 1
        if !bridge.isEmpty{
            if bridge.first!.1 == 0 {
                curWeight -= bridge.first!.0
                bridge.removeFirst()
            }
        }
        if !trucks.isEmpty, weight >= curWeight + trucks[0].0{
            let popTruck = trucks.removeFirst()
            curWeight += popTruck.0
            bridge.append(popTruck)
        }
        for i in 0..<bridge.count{
            bridge[i].1 -= 1
        }
    }while !bridge.isEmpty
    
    return result
}

print(solution(2, 10, [7,4,5,6]))
print(solution(100, 100, [10]))
print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))
