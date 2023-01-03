//
//  main.swift
//  크기가 작은 부분문자열
//
//  Created by 유현진 on 2023/01/03.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var t = t.map{$0}
    var count = 0
    for index in 0...t.count - p.count{
        if String(t[index..<index+p.count]) <= p{
            count += 1
        }
    }
    return count
}

print(solution("3141592", "271"))
print(solution("500220839878", "7"))
print(solution("10203", "15"))

