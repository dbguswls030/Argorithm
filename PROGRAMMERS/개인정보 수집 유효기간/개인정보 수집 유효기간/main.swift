//
//  main.swift
//  개인정보 수집 유효기간
//
//  Created by 유현진 on 11/30/24.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    var limit = [String : Int]()
    let todayToArray = today.split(separator: ".").map{ Int($0)! }
    
    for term in terms {
        let t = term.split(separator: " ").map{String($0)}
        limit[t[0]] = Int(t[1])!
    }
    
    for (offset, privacy) in privacies.enumerated() {
        let p = privacy.split(separator: " ").map{String($0)}
        var dayToPrivacy = p[0].split(separator: ".").map{Int($0)!}
        dayToPrivacy[0] += limit[p[1]]! / 12
        dayToPrivacy[1] += limit[p[1]]! % 12
        
        if dayToPrivacy[1] > 12 {
            dayToPrivacy[1] -= 12
            dayToPrivacy[0] += 1
        }
        dayToPrivacy[2] -= 1
        if dayToPrivacy[2] < 1{
            dayToPrivacy[2] = 28
            dayToPrivacy[1] -= 1
            if dayToPrivacy[1] < 1{
                dayToPrivacy[0] -= 1
                dayToPrivacy[1] = 12
            }
        }
        
        if (todayToArray[0] > dayToPrivacy[0]) ||
            (todayToArray[0] == dayToPrivacy[0] && todayToArray[1] > dayToPrivacy[1]) ||
            (todayToArray[0] == dayToPrivacy[0] && todayToArray[1] == dayToPrivacy[1] && todayToArray[2] > dayToPrivacy[2])
        {
            result.append(offset+1)
        }
        
    }
    
    return result.sorted()
}

//print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
//print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]))
//print(solution("2020.10.15", ["A 100"], ["2018.06.16 A", "2008.02.15 A"]))
print(solution("2020.01.01", ["A 100", "B 11"], ["2019.01.28 A", "2019.02.01 B"]))
