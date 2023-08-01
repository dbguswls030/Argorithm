//
//  main.swift
//  의상
//
//  Created by 유현진 on 2023/08/01.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesDict = [String : [String]]()
    var result = 0
    for c in clothes{
        let key = c[1]
        let value = c[0]
//        print(key, value)
        if clothesDict.keys.contains(key){
            clothesDict[key]?.append(value)
        }else{
            clothesDict[key] = [value]
        }
    }
    
    
        var count = 1
        for c in clothesDict{
            count *= c.value.count + 1
        }
        result += count
    
    return result - 1
}

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
print(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]))
