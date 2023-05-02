//
//  main.swift
//  다음 큰 수
//
//  Created by 유현진 on 2023/05/02.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    var count = 0
    for i in String(n, radix: 2){
        if i == "1"{
            count += 1
        }
    }
    
    for i in n+1...10000000{
        var tCount = 0
        for j in String(i, radix: 2){
            if j == "1"{
                tCount += 1
            }
        }
        if count == tCount{
            answer = i
            break
        }
    }
    
    return answer
}

//print(solution(78))
print(solution(15))
