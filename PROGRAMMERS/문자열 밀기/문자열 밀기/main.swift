//
//  main.swift
//  문자열 밀기
//
//  Created by 유현진 on 2023/01/03.
//

import Foundation

func solution(_ A:String, _ B:String) -> Int {
    if A == B { return 0 }
    var a = A.map{$0}
    for count in 1..<a.count{
        a.insert(a.removeLast(), at: .zero)
        print(a)
        if String(a) == B{
            return count
        }
    }
    return -1
}

print(solution("hello", "ohell"))
print(solution("apple", "elppa"))
