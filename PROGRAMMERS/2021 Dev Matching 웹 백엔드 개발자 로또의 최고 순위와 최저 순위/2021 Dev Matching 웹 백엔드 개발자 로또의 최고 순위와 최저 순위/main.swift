//
//  main.swift
//  2021 Dev Matching 웹 백엔드 개발자 로또의 최고 순위와 최저 순위
//
//  Created by 유현진 on 2022/06/28.
//

import Foundation
print(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19])) //3, 5
print(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25])) //1, 6
print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35])) //1, 1
func winRank(num: Int) -> Int{
    switch num{
    case 6: return 1
    case 5: return 2
    case 4: return 3
    case 3: return 4
    case 2: return 5
    default: return 6
    }
}
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let unknownNumCount = lottos.filter { $0 == 0 }.count
    var winCount = 0
    
    for num in lottos.filter({ $0 != 0 }){
        if win_nums.contains(num){
            winCount += 1
        }
    }
    return [winRank(num: winCount+unknownNumCount), winRank(num: winCount)]
}

