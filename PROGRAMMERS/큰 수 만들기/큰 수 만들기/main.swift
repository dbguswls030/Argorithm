//
//  main.swift
//  큰 수 만들기
//
//  Created by 유현진 on 4/14/25.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var k = k
    var result = [String]()
    let numberArray = number.map{ String($0) }
    
    for num in numberArray{
        while !result.isEmpty, Int(result.last!)! < Int(num)!, k > 0{
            result.removeLast()
            k-=1
        }
        result.append(num)
    }
    while k>0{
        k-=1
        result.removeLast()
    }
    return result.joined()
}

//print(solution("1924", 2))
//print(solution("1231234", 3))
print(solution("4177252841", 4))

