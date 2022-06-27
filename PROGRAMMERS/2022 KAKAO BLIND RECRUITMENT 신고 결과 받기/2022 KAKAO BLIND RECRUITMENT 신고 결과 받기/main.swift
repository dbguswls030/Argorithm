//
//  main.swift
//  2022 KAKAO BLIND RECRUITMENT 신고 결과 받기
//
//  Created by 유현진 on 2022/06/27.
//

import Foundation
print(solution(["muzi", "frodo", "apeach", "neo"],["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
print(solution(["con", "ryan"],["ryan con", "ryan con", "ryan con", "ryan con"],3))

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportedNameCount = [String : Int]() // id별 신고 누적 횟수
    var reportListDict = [String : [String]]() // id 별 신고한 id 리스트, [0]는 신고자, 이후엔 신고한 id 리스트이다.
    
    // id별 신고 누적 횟수 2차원 배열로 초기화
    for i in id_list{
        reportedNameCount[i] = 0
        reportListDict[i] = []
    }

    for i in Array(Set(report)){
        let temp = i.split(separator: " ").map {String($0)}
        let reporter = temp[0] // 신고한 사람
        let reportee = temp[1] // 신고된 사람
        reportedNameCount[reportee]! += 1
        reportListDict[reporter]?.append(reportee)
    }

    var result = [Int]()
    for reporter in id_list{
        var count = 0
        for i in reportListDict[reporter]!{
            if reportedNameCount[i]! >= k {
                count += 1
            }
        }
        result.append(count)
    }
    return result
}
