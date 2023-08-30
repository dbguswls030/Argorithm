//
//  main.swift
//  양궁대회
//
//  Created by 유현진 on 2023/08/30.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var result = [Int]()
    var maxLion = 0
    
    func compareLowPoint(left: [Int], right: [Int]) -> [Int]{
        for i in (0..<info.count).reversed(){
            if left[i] == 0, right[i] == 0 {
                continue
            }else if left[i] == right[i]{
                continue
            }else{
                if left[i] > right[i]{
                    return left
                }else if left[i] < right[i]{
                    return right
                }
            }
        }
        return left
        
        
    }
    
    func sumApeachScore() -> Int{
        var score = 0
        for i in 0..<info.count{
            if info[i] != 0{
                score += 10-i
            }
        }
        return score
    }
//    print(sumApeachScore())
//    print(info)
    func bt(s: Int, apeach: Int, lion: Int, index: Int, lionScore: [Int]){
        let curScore = 10 - index
        
        if s == 0{
            if apeach < lion{
                if lion-apeach >= maxLion{
//                    print(lion, apeach)
//                    print(lion - apeach, maxLion)
                    if result.count == 0 {
                        result = lionScore
                    }else if maxLion == lion-apeach{
                        result = compareLowPoint(left: result, right: lionScore)
                    }else{
                        result = lionScore
                    }
                    
                    maxLion = lion-apeach
//                    print(result)
                }
            }
            return
        }
        
        if index == info.count{
            return
        }
        
        if info[index] == 0{
            var lionScore1 = lionScore
            lionScore1[index] = 1
            bt(s: s-1, apeach: apeach, lion: lion+curScore, index: index+1, lionScore: lionScore1)
        }else if index == info.count-1, s != 0{
            var lionScore3 = lionScore
            lionScore3[index] = s
            bt(s: 0, apeach: apeach, lion: lion, index: index+1, lionScore: lionScore3)
            return
        }else if s >= info[index] + 1{
            var lionScore2 = lionScore
            lionScore2[index] = info[index] + 1
            bt(s: s - (info[index] + 1),apeach: apeach-curScore ,lion: lion+curScore, index: index+1, lionScore: lionScore2)
        }
        bt(s: s, apeach: apeach, lion: lion, index: index+1, lionScore: lionScore)
    }
    
    bt(s: n, apeach: sumApeachScore(), lion: 0, index: 0, lionScore: Array(repeating: 0, count: info.count))
    return result.count == 0 ? [-1] : result
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
print(solution(1, [1,0,0,0,0,0,0,0,0,0,0]))
print(solution(9, [0,0,1,2,0,1,1,1,1,1,1]))
print(solution(10, [0,0,0,0,0,0,0,0,3,4,3]))
