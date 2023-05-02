//
//  main.swift
//  JadenCase 문자열 만들기
//
//  Created by 유현진 on 2023/05/02.
//

import Foundation

func solution(_ s:String) -> String{
    
    var result = ""
    var space = true
    for i in s{
        if i == " "{
            result += " "
            space = true
            continue
        }
        
        if space == true{
            result += i.uppercased()
            space = false
        }else{
            result += i.lowercased()
        }
    }
    return result
}
print(solution("3people unFollowed me"))
print(solution("aD aa   DD"))
