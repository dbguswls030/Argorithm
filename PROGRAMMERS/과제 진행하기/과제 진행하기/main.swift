//
//  main.swift
//  과제 진행하기
//
//  Created by 유현진 on 2023/06/15.
//

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    func convertHourToMinute(time: String) -> Int{
        var s = time.split(separator: ":")
        return Int(s[0])! * 60 + Int(s[1])!
    }
    func convertMinute(minute: String) -> Int{
        return Int(minute)!
    }
    var plans = plans
    plans.sort{convertHourToMinute(time: $0[1]) < convertHourToMinute(time: $1[1])}
//    print(plans)
    var stack = [[String]]() // 미룬 과제들
    var result = [String]()
   
    while plans.count != 1{
        var start = plans.removeFirst()
        let s = convertHourToMinute(time: start[1])
        let study = convertMinute(minute: start[2])
        
        let nextS = convertHourToMinute(time: plans.first![1])
        let nextStudy = convertMinute(minute: plans.first![2])
        
        if s + study > nextS{ // 다음 과제 전에 못 끝낸다?
            stack.append([start[0], String(s+study-nextS)])
        }else{ // 다음 과제 전에 끝낸다
            result.append(start[0])
            
            var cur = s+study
            while !stack.isEmpty, cur < nextS{
                let tempS = convertMinute(minute: stack.last![1])
                
                if cur + tempS <= nextS{
                    result.append(stack.removeLast()[0])
                    cur += tempS
                }else{
                    stack[stack.endIndex-1][1] = String(s + study + tempS - nextS)
                    break
                }
            }
        }
    }
    
    result.append(plans[0][0])

    while !stack.isEmpty{
        result.append(stack.removeLast()[0])
    }
    return result
}

//print(solution([["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]]))
//print(solution([["science", "12:40", "50"], ["music", "12:20", "40"], ["history", "14:00", "30"], ["computer", "12:30", "100"]]))
//print(solution([["aaa", "12:00", "20"], ["bbb", "12:10", "30"], ["ccc", "12:40", "10"]]))
print(solution([["1","00:00", "30"], ["2", "00:10", "10"], ["3","00:30", "10"], ["4", "00:50", "10"]]))

//
