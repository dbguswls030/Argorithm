//
//  main.swift
//  추석 트래픽
//
//  Created by 유현진 on 2023/05/17.
//

import Foundation

func solution(_ lines:[String]) -> Int {
    var times = [[Int]]()
    for line in lines {
        let a = convertStringToTime(s: line.split(separator: " "))
        times.append(a)
    }
    var result = 0
    for time in times {
        result = max(result, compareAndCount(times: times, start: time[0], end: time[0] + 1000), compareAndCount(times: times, start: time[1], end: time[1] + 1000))
    }
    return result
}
func compareAndCount(times: [[Int]], start: Int, end: Int) -> Int{
    var count = 0
    for i in times{
        let s = i[0]
        let e = i[1]
        if start <= e, end > s{
            count += 1
        }
    }
    return count
}
func convertStringToTime(s: [Substring]) -> [Int]{
    var s = s
    s.removeFirst()
    let times = s[0].split(separator: ":")
    let hour = Int(times[0])! * 3600000
    let minute = Int(times[1])! * 60000
    let second = times[2].split(separator: ".")
    let ss = Int(second[0])! * 1000
    let sss = Int(second[1])!
    s[1].removeLast()
    let t = s[1].split(separator: ".")
    var tss = Int(t[0])! * 1000
    if t.count != 1 {
        tss += Int(t[1])!
    }
    return [hour+minute+ss+sss-tss + 1, hour+minute+ss+sss]
}

print(solution([
    "2016-09-15 01:00:04.001 2.0s",
    "2016-09-15 01:00:07.000 2s"
    ]))

print(solution([
    "2016-09-15 01:00:04.002 2.0s",
    "2016-09-15 01:00:07.000 2s"
    ]))

print(solution([
    "2016-09-15 20:59:57.421 0.351s",
    "2016-09-15 20:59:58.233 1.181s",
    "2016-09-15 20:59:58.299 0.8s",
    "2016-09-15 20:59:58.688 1.041s",
    "2016-09-15 20:59:59.591 1.412s",
    "2016-09-15 21:00:00.464 1.466s",
    "2016-09-15 21:00:00.741 1.581s",
    "2016-09-15 21:00:00.748 2.31s",
    "2016-09-15 21:00:00.966 0.381s",
    "2016-09-15 21:00:02.066 2.62s"
    ]))
