//
//  main.swift
//  신을 모시는 사당
//
//  Created by 유현진 on 2023/01/14.
//


import Foundation
func solution(){
    var n = Int(readLine()!)!
    var list = readLine()!.components(separatedBy: " ").map {Int($0)!}
    var left = 0
    var right = 0
    
    for i in list{
        if i == 1{
            left += 1
        }else{
            right += 1
        }
    }
    print(abs(left-right))
}

solution()
