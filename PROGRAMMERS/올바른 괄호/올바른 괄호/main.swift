//
//  main.swift
//  올바른 괄호
//
//  Created by 유현진 on 2023/04/04.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var c = 0
    for i in s{
        if i == "("{
            c += 1
        }else{
            c -= 1
            if c < 0 { return false}
        }
    }
    return c == 0 ? true : false
}

print(solution("()()"))
print(solution("(())()"))
print(solution(")()("))
print(solution("(()("))

print(solution("))"))
print(solution("())"))
