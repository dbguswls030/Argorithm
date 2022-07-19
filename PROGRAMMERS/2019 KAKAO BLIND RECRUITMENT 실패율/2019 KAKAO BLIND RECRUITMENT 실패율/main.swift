//
//  main.swift
//  2019 KAKAO BLIND RECRUITMENT 실패율
//
//  Created by 유현진 on 2022/07/19.
//

import Foundation
print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
print(solution(4, [4,4,4,4,4]))
// 스테이지 2차원 배열 만들기 N행 2열
// (현재 스테이지보다 높은 사람 = 스테이지 클리어한 사람) 구하기
// 현재 스테이지인 사람 구하기 = 전체 스테이지 수에서 스테이지 클리어한 사람 빼기
// 스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수 / 스테이지에 도달한 플레이어 수
// 스테이지 번호를 실패율 내림차순으로 정렬한다. 만약 실패율이 같으면 스테이지 번호가 낮은 게 우선순위이다.
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageArr = [(Int,Float)]()
    var player = stages.count
    for i in 1...N{
        var clear = 0
        for item in stages{
            if i == item{
                clear += 1
            }
        }
        player -= clear

        stageArr.append((i, Float(clear)/Float(player)))
    }
    stageArr.sort{$0.1 > $1.1}
    return stageArr.map{$0.0}
}
// func solution(_ N:Int, _ stages:[Int]) -> [Int] {
//     var stageArr: [[Float]] = Array(repeating: Array(repeating: 0, count: 0), count: N+1)
//     for i in 1..<stageArr.count{
//         stageArr[i].append(Float(i))
//         stageArr[i].append(Float(stages.filter{ $0 == i }.count))
//         stageArr[i].append(Float(stages.filter{$0 >= i}.count))
//         stageArr[i].append(stageArr[i][1]/stageArr[i][2])
//     }
//     stageArr[1..<stageArr.count].sort{$0[3] > $1[3]}
//     return stageArr[1..<stageArr.count].map{Int($0[0])}
// }
