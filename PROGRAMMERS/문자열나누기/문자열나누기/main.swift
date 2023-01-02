//
//  main.swift
//  문자열나누기
//
//  Created by 유현진 on 2023/01/02.
//

import Foundation

func solution(_ s:String) -> Int {

    var first = s.first
    var c: Character? = first
    var div = 0
    var same = 0
    var other = 0
    for letter in s{
        if c == nil{
            c = letter
        }
        if c == letter{
            same += 1
        }else{
            other += 1
        }
        if same == other{
            div += 1
            c = nil
            same = 0
            other = 0
        }
    }
    if c != nil{
        // 19번 줄에서 c에 넣어 준 letter을 28번 줄에서 nil로 초기화 못 했을 경우 same / other 두 횟수가 다른 상태에서 더 이상 읽을 글자가 없는 상태가 된다.
        div += 1
    }
    return div
}

print(solution("banana"))
print(solution("abracadabra"))
print(solution("aaabbaccccabba"))
