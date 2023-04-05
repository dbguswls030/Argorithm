//
//  main.swift
//  모음 사전
//
//  Created by 유현진 on 2023/04/05.
//

import Foundation

func solution(_ word:String) -> Int {
    let list = "AEIOU"
    var stack = ""
    var count = 0
    var result = 0
    func dfs(){
        
        for i in list{
            stack.append(i)
            count += 1
            if word == stack {
                result = count
            }
            if stack.count < 5{
                dfs()
            }
            stack.removeLast()
        }
    }
    
    dfs()
    return result
}

print(solution("AAAAE"))
//print(solution("AAAE"))
//print(solution("I"))
//print(solution("EIO"))
