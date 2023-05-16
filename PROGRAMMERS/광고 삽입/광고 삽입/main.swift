//
//  main.swift
//  광고 삽입
//
//  Created by 유현진 on 2023/05/16.
//

import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    var times = Array(repeating: 0, count: convertTimeToInt(time: play_time)+1)
    var result = times
    var pt = convertTimeToInt(time: play_time)
    var adTime = convertTimeToInt(time: adv_time)
    
    for log in logs {
        let splitLog = log.split(separator: "-")
        times[convertTimeToInt(time: String(splitLog[0]))] += 1
        times[convertTimeToInt(time: String(splitLog[1]))] -= 1
    }
    //시청자수
    for i in 1..<times.count{
        times[i] += times[i-1]
    }
    //누적 재생횟수
    for i in 1..<times.count{
        times[i] += times[i-1]
    }
    var sum = times[adTime]
    var idx = 0
    for i in adTime..<pt{
        if sum < times[i] - times[i - adTime]{
            sum = times[i] - times[i - adTime]
            idx = i - adTime + 1
        }
    }
   
    return convertIntToTime(int: idx)
}
func convertTimeToInt(time: String) -> Int{
    let a = time.split(separator: ":")
    let aHour = a[0]
    let aMinute = a[1]
    let aSecond = a[2]
    let aLen = (Int(aHour)! * 60 * 60) + Int(aMinute)! * 60 + Int(aSecond)!
    return aLen
}
func convertIntToTime(int: Int) -> String{
    var int = int
    let hour = int / 3600
    int %= 3600
    let minute = int / 60
    let second = int % 60
    let hh = hour > 9 ? String(hour) : "0\(hour)"
    let mm = minute > 9 ? String(minute) : "0\(minute)"
    let ss = second > 9 ? String(second) : "0\(second)"
    return "\(hh):\(mm):\(ss)"
}

print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]))
