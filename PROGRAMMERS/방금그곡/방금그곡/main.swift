//
//  main.swift
//  방금그곡
//
//  Created by 유현진 on 2023/08/08.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = (0, "")
    func convertTime(a: String, b: String) -> Int{
        let left = a.split(separator: ":")
        let right = b.split(separator: ":")
        let leftM = Int(left[0])! * 60 + Int(left[1])!
        let rightM = Int(right[0])! * 60 + Int(right[1])!
        
        return rightM - leftM
    }
    func separateScore(score: [String]) -> [String]{
        var returnScore = [String]()
        var index = 0
        while index < score.count{
            var temp = score[index]
            if index + 1 < score.count, score[index + 1] == "#"{
                temp.append(score[index + 1])
                index += 1
            }
            returnScore.append(temp)
            index += 1
        }
        return returnScore
    }
    let m = separateScore(score: m.map{String($0)})
    func isEqalScore(runningTime: Int, score: [String]) -> Bool{
        var index = 0
        var mIndex = 0
        var eqalFlag = false
        while index < runningTime{
//            print(index, mIndex)
//            print(m[mIndex % m.count], score[index % score.count])
            if m[mIndex % m.count] == score[index % score.count]{
                mIndex += 1
                eqalFlag = true
            }else if eqalFlag == true, m[mIndex % m.count] != score[index % score.count]{
                index -= 1
                mIndex = 0
                eqalFlag = false
            }
            if m.count == mIndex {
                return true
            }
            index += 1
        }
        return false
    }
//    print(m)
    for musicinfo in musicinfos {
        let info = musicinfo.split(separator: ",")
        let start = info[0]
        let end = info[1]
        let runningTime = convertTime(a: String(start), b: String(end))
        
        let title = info[2]
        let musicScore = separateScore(score: info[3].map{String($0)})
        
        
        if isEqalScore(runningTime: abs(runningTime), score: musicScore){
            if abs(runningTime) > abs(result.0){
                result = (runningTime, String(title))
            }
        }
//        print(result)
    }
    
    return result.1 == "" ? "(None)" : result.1
}

print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))
print(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("CCB", ["03:00,03:10,FOO,CCB#CCB", "04:00,04:08,BAR,ABC"]))
print(solution("ABCDEFG", ["12:00,00:00,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("CDEFGAC", ["12:00,12:06,HELLO,CDEFGA"]))
print(solution("DF", ["6:20,6:50,TEST,DDF"]))
