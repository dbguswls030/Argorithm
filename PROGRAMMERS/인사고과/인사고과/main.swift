//
//  main.swift
//  인사고과
//
//  Created by 유현진 on 2023/05/03.
//

import Foundation
// 근무 태도 점수, 동료 평가 점수
// 다른 사원보다 두 점수가 "모두" 낮은 경우가 한 번이라도 있다면 인센티브 제외
// 이를 제외한 사원들 중에 두 점수의 합이 높은 순으로 석차
// 점수의 합이 동일한 사원들은 동석차, 동석차 수만큼 다음 석차는 건너 뜀

func solution(_ scores:[[Int]]) -> Int {
    var scores = scores
    let wan = scores.first!
    var result = 1
    scores.sort{ $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] > $1[0]}
    
    var maxScore = 0
    for score in scores {
        if maxScore > score[1]{
            if score == wan{
                return -1
            }
        }else{
            maxScore = max(maxScore, score[1])
            if score[0] + score[1] > wan[0] + wan[1]{
                result += 1
            }
        }
        
    }
    return result
}

print(solution([[2,2],[1,4],[3,2],[3,2],[2,1]]))
//print(solution([[1, 1], [1, 1], [1, 1], [1, 1], [1, 1]]))
//print(solution([[3, 1], [1, 4], [2, 3], [2, 3], [1, 5], [1, 0], [1, 0]]))
