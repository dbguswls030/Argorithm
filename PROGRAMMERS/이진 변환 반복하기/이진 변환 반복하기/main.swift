//
//  main.swift
//  이진 변환 반복하기
//
//  Created by 유현진 on 2023/09/04.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var count = 0
    var zeroCount = 0
    while s != "1"{
        
        var temp = s.filter{$0 != "0"}.count
        zeroCount += s.count - temp
        s = String(temp, radix: 2)
        count += 1
    }
    return [count, zeroCount]
}
print(solution("01110"))
print(solution("110010101001"))
