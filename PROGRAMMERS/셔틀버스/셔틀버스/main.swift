//
//  main.swift
//  셔틀버스
//
//  Created by 유현진 on 2023/09/14.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    func convertTime(_ time: String) -> Int{
        let tt = time.split(separator: ":")
        return Int(tt[0])! * 60 + Int(tt[1])!
    }
    func convertString(_ time: Int) -> String{
        let h = "\(time/60)".count == 1 ? "0\(time/60)" : "\(time/60)"
        let m = "\(time%60)".count == 1 ? "0\(time%60)" : "\(time%60)"
        return "\(h):\(m)"
    }
    let timeTable = timetable.sorted{convertTime($0) < convertTime($1)}
    var timeTableIndex = 0
    var cur = convertTime("09:00")
    var totalPerson = 0
    for seq in 1...n{
        var personel = 0
        while timeTableIndex < timeTable.count, personel < m{
            if cur >= convertTime(timeTable[timeTableIndex]){
                timeTableIndex += 1
                personel += 1
                totalPerson += 1
                
                if seq == n, personel == m {
                    timeTableIndex -= 1
                    var temp = convertTime(timeTable[timeTableIndex])
                    timeTableIndex -= 1
                    while timeTableIndex >= 0{
                        if temp > convertTime(timeTable[timeTableIndex]){
                            return convertString(convertTime(timeTable[timeTableIndex+1])-1)
                        }
                        timeTableIndex -= 1
                    }
                    return convertString(convertTime(timeTable[0])-1)
                }
            }else{
                break
            }
        }
        cur += t
    }
    cur -= t
    
    if timeTableIndex == timeTable.count { timeTableIndex -= 1}
    if totalPerson == m * n{
        return convertString(convertTime(timeTable[timeTableIndex])-1)
    }else{
        return convertString(cur)
    }
//    if convertTime(timeTable[timeTableIndex]) < convertTime("09:00"){
//        print("!")
//        return "09:00"
//    }
//    return convertString(cur)
}

print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))
print(solution(2, 10, 2, ["09:10", "09:09", "08:00"]))
print(solution(2, 1, 2, ["09:00", "09:00", "09:00", "09:00"]))
print(solution(1, 1, 5, ["00:01", "00:01", "00:01", "00:01", "00:01"]))
print(solution(1, 1, 1, ["23:59"]))
print(solution(10, 60, 45, ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"]))
print(solution(10, 25, 1, [ "09:00", "09:10" ,"09:20" ,"09:30" ,"09:40" ,"09:50",
    "10:00", "10:10" ,"10:20" ,"10:30" ,"10:40" ,"10:50" ]))
