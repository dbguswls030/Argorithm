//
//  main.swift
//  핸드폰 번호 가리기
//
//  Created by 유현진 on 2023/02/09.
//

import Foundation

func solution(_ phone_number:String) -> String {
    var result = ""
    for (index, value) in phone_number.enumerated(){
        if index < phone_number.count - 4{
            result += "*"
        }else{
            result += String(value)
        }
    }
    return result
}

print(solution("01033334444"    ))
