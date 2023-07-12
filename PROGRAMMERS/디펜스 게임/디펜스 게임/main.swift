//
//  main.swift
//  디펜스 게임
//
//  Created by 유현진 on 2023/07/11.
//

import Foundation
//func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
//    var n = n
//    var result = 0
//    if k >= enemy.count{
//        return enemy.count
//    }
//    var index = 0
//    var maxValue = [(offset: Int, value: Int)]()
//    while index < enemy.count, n > 0{
//        if maxValue.count < k{
//            maxValue.append((index, enemy[index]))
//        }else{
//            let minE = maxValue.enumerated().min{$0.1.value < $1.1.value}!
//            if minE.1.value < enemy[index]{
//                n -= minE.1.value
//                maxValue[minE.0] = (index, enemy[index])
//            }else{
//                n -= enemy[index]
//            }
//        }
//        result = index
//        index += 1
//        if n < 0 {
//            result -= 1
//        }
//    }
//    return result + 1
//}
func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var n = n
    var result = 0
    var enemys = Array(repeating: 0, count: 1000001)
    var minE = 1000001
    if k >= enemy.count{
        return enemy.count
    }
    
    for i in 0..<k{
        enemys[enemy[i]] += 1
        if minE > enemy[i]{
            minE = enemy[i]
        }
    }
    result = k
    for i in result..<enemy.count{
        if minE < enemy[i]{
            enemys[minE] -= 1
            enemys[enemy[i]] += 1
            n -= minE
            // 무적권 쓴 거 중에 가장 작은 거 가져오기
            if enemys[minE] == 0 {
                for j in minE+1..<enemys.count{
                    if enemys[j] > 0{
                        minE = j
                        break
                    }
                }
            }
        }else{
            n -= enemy[i]
        }
        
        if n < 0{
            break
        }
        result += 1
    }
    
    return result
}

print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
print(solution(2, 4, [3, 3, 3, 3]))
print(solution(7, 3, [5, 5, 5, 5, 2, 3, 1]))
print(solution(1, 6, [2, 2, 2, 2, 3, 3, 1]))
print(solution(10, 1, [2, 2, 2, 2, 2, 10]))
print(solution(10, 1, [2, 2, 2, 2, 10   ]))
