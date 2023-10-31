//
//  main.swift
//  N으로 표현
//
//  Created by 유현진 on 2023/10/31.
//

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number{
        return 1
    }
    func stringToNum(count: Int)->Int{
        var returnNum = ""
        for _ in 1...count{
            returnNum.append(String(N))
        }
        return Int(returnNum)!
    }
    var dp = [[0],[N]]
    if dp[1].contains(number){
        return 2
    }

    for dept in 2...8{
        var addList = Set<Int>()
        dp.append([stringToNum(count: dept)])
//        addList.insert(stringToNum(count: dept))
        for z in 1..<dept{
            for i in dp[z]{
                for j in dp[dept-z]{
                    addList.insert(i+j)
                    addList.insert(i-j)
                    addList.insert(j-i)
                    addList.insert(j*i)
                    if j != 0{
                        addList.insert(i/j)
                    }
                    if i != 0{
                        addList.insert(j/i)
                    }
                }

            }
        }
        dp[dept] += (Array(addList))
        if dp[dept].contains(number){
//            print(dp)
            return dept
        }

    }
    return -1
}

print(solution(5, 3025)) // 4
print(solution(5, 12)) // 4
print(solution(2, 11)) // 3
print(solution(1, 121)) // 4
