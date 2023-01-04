//
//  main.swift
//  과일 장수
//
//  Created by 유현진 on 2023/01/04.
//

import Foundation
// 사과 상태 1등급부터 K 등급
// 한 상자에 사과 m 개씩
// 상자에 담긴 사과 중 가장 점수가 낮은 p의 사과 * m은 한 상자의 가격이다.
//
print("Hello, World!")

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var cash = 0
    //k 보다 낮은 것들 필터
    var filterScore = score.filter{$0 <= k}.sorted(by: >)

    var index = 0
    
    while filterScore.count >= index + m{
        cash += filterScore[index+m - 1] * m
        index += m
    }
    
    return cash
}
print(solution(3, 4, [1, 2, 3, 1, 2, 3, 1]))
print(solution(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))
