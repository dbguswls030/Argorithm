//
//  main.swift
//  큰 수 만들기
//
//  Created by 유현진 on 2023/07/29.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack = [Character]()
    var k = k
    for n in number{
        while !stack.isEmpty, Int(String(stack.last!))! < Int(String(n))!, k > 0{
            k -= 1
            stack.removeLast()
        }
        stack.append(n)
    }
    while k>0{
        k-=1
        stack.removeLast()
    }
    return String(stack)
}

print(solution("1924", 2))
print(solution("1231234", 3))
print(solution("4177252841", 4))
