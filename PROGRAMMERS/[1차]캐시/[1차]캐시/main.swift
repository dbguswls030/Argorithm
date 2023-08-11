//
//  main.swift
//  [1차]캐시
//
//  Created by 유현진 on 2023/08/11.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 {
        return cities.count * 5
    }
    var c = [(String,Int)]()
    var result = 0
    
    func addAll(index: Int){
        for offset in 0..<c.count{
            if offset != index{
                c[offset].1 += 1
            }
        }
    }
    func cacheMiss(city: String){
        var max = -1
        var index = -1
        for i in 0..<c.count{
            c[i].1 += 1
            if max < c[i].1{
                max = c[i].1
                index = i
            }
        }
        c[index] = (city, 0)
    }
//    for city in cities {
//        print(c)
//        let city = city.uppercased()
//        if c.count == cacheSize{
//            if let index = c.firstIndex(where: {$0.0 == city}){
//                result += 1
//                addAll(index: index)
//                c[index].1 = 0
//            }else{
//                cacheMiss(city: city)
//                result += 5
//            }
//        }else{
//            for i in 0..<c.count{
//                c[i].1 += 1
//            }
//            c.append((city, 0))
//            result += 5
//        }
//    }
    for city in cities {
        let city = city.uppercased()
        if let index = c.firstIndex(where: {$0.0 == city}){
            result += 1
            addAll(index: index)
            c[index].1 = 0
        }else{
            if c.count != cacheSize{
                for i in 0..<c.count{
                    c[i].1 += 1
                }
                c.append((city, 0))
            }else{
                cacheMiss(city: city)
            }
            
            result += 5
        }
    }
    return result
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
