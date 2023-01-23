//
//  main.swift
//  체육복
//
//  Created by 유현진 on 2023/01/20.
//

import Foundation
// 반복문 도중에 배열 삭제하면 안 됨
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var result = n - lost.count
    var lost = lost
    var reserve = reserve
    var lostIndex = [Int]()
    
    for (index,value) in lost.enumerated(){
        if let i = reserve.firstIndex(of: value){
//            lost.remove(at: index)
            lostIndex.append(index)
            reserve.remove(at: i)
            result += 1
        }
    }
    for i in lostIndex{
        lost.remove(at: i)
    }

    for tempNum in reserve{
        let left = tempNum - 1
        let right = tempNum + 1
        
        var index = 0
        while lost.count-1 >= index{
            if lost[index] == left || lost[index] == right{
                lost.remove(at: index)
                result += 1
            }else{
                index += 1
            }
        }
    }
    return result
}

print(solution(5, [2,4], [1,3,5]))
print(solution(5, [2,4], [3]))
print(solution(3, [3], [1]))
print(solution(8, [5,6,7,8], [4,7]))
