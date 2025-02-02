//
//  main.swift
//  상담원 인원
//
//  Created by 유현진 on 2/2/25.
//

import Foundation

//func solution(_ k:Int, _ n:Int, _ reqs:[[Int]]) -> Int {
//    var typeCounsels = Array(repeating: 1, count: k) // 상담 유형 k
//    var remainTimes = Array(repeating: 0, count: k)
//
//    // 참가자 req, [a,b,c] a 분에 b 분동안 c번 유형의 상담을
//    // 모든 참가자의 대기 시간이 최소가 되도록 상담 유형별로 멘토를 정해야 함
//    // 모든 참가자 대기 시간 총합을 구하라
//    var result = Int.max
//    
//    func counsel(typeNum: Int, counselLimit: Int){
//        let typeReq = reqs.filter{ $0[2] == typeNum }
//        var times = Array(repeating: 0, count: 1001)
//        var remainTime = 0
//        for req in typeReq {
//            let start = req[0]
//            let time = req[1]
//            let end = start + time
//
//            if times[start] < counselLimit{
//                (start..<end).forEach{ i in
//                    times[i] += 1
//                }
//            }else{
//                if let index = times[start..<1001].firstIndex(where: { $0 < times[start] }){
//                    for i in index..<index+time{
//                        times[i] += 1
//                    }
//                    remainTime += index - start
//                }
//            }
//        }
//        remainTimes[typeNum-1] = remainTime
//    }
//    
//    for _ in 0...n-k{
//        remainTimes = Array(repeating: 0, count: k)
//        for i in 1...k{
//            counsel(typeNum: i, counselLimit: typeCounsels[i-1])
//        }
//        var maxIndex = -1
//        var maxRemain = 0
//        for i in 0..<k{
//            if maxRemain < remainTimes[i]{
//                maxIndex = i
//                maxRemain = remainTimes[i]
//            }
//        }
//
//        typeCounsels[maxIndex] += 1
//
//        result = min(result, remainTimes.reduce(0, +))
//    }
//    return result
//}
    
func solution(_ k:Int, _ n:Int, _ reqs:[[Int]]) -> Int{
    // 모든 참가자의 대기 시간이 최소가 되도록 상담 유형별로 멘토를 정해야 함
    // 모든 참가자 대기 시간 총합을 구하라
    var counseler = Array(repeating: 1, count: k)
    var result = Int.max

    func calculateWaitTime(typeCounts: [Int]) -> Int{
        var totalWaitTime = 0
        for type in 1...k{
            let typeReqs = reqs.filter{$0[2] == type}
            let counselerCount = typeCounts[type - 1]
            var availableTimes = Array(repeating: 0, count: counselerCount) // 각 상담사 별 상담 끝나는 시각
            
            for req in typeReqs{
                let start = req[0] // 상담 요청 시각
                let duration = req[1] // 상담 시간
                
                availableTimes.sort() // 가장 먼저 상담이 끝나는 멘토 찾기
                let earliestAvailable = availableTimes[0]
                
                let waitTime = max(earliestAvailable - start, 0) // 대기 시간 계산
                totalWaitTime += waitTime
                
                // 상담 종료 시간 업데이트
                availableTimes[0] = max(start, earliestAvailable) + duration
            }
        }
        return totalWaitTime
    }
    
    // 백트래킹
    func dfs(remaining: Int, index: Int){
        if index == k {
            result = min(result, calculateWaitTime(typeCounts: counseler))
            return
        }
       
        for add in 0...remaining{
            counseler[index] += add
            dfs(remaining: remaining - add, index: index + 1)
            counseler[index] -= add
        }
    }
    // 상담원(n) - 상담 유형(k) = 상담 유형에 추가 배치할 수 있는 상담원
    dfs(remaining: n-k, index: 0)
    
    return result
}
print(solution(3, 5, [[10, 60, 1], [15, 100, 3], [20, 30, 1], [30, 50, 3], [50, 40, 1], [60, 30, 2], [65, 30, 1], [70, 100, 2]]))
print(solution(2, 3, [[5, 55, 2], [10, 90, 2], [20, 40, 2], [50, 45, 2], [100, 50, 2]]))
print(solution(1, 1, [[0, 100, 1], [50, 100, 1], [200, 300, 1], [500, 100, 1]]))
