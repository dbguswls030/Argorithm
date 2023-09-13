//
//  main.swift
//  가장 긴 펠린드롬
//
//  Created by 유현진 on 2023/09/13.
//

import Foundation

func solution(_ s:String) -> Int {
    if s.count < 2{
        return s.count
    }
    var dept = s.count
    let s = Array(s)
    var result = 1
    while dept > 0{
        for index in 0..<s.count - dept{
            var l = index
            var r = index + dept
            while l <= r{
                if s[l] != s[r]{
                    break
                }
                l += 1
                r -= 1
            }
            if l >= r{
                return dept + 1
            }
        }
        dept -= 1
    }
    return result
}
print(solution("abcdcba"))
print(solution("abacde"))
