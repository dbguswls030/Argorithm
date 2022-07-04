//
//  main.swift
//  2021 KAKAO BLIND RECRUITMENT 신규 아이디 추천
//
//  Created by 유현진 on 2022/07/04.
//

import Foundation

func solution(_ new_id:String) -> String {
    var addDotFlag = true
    var newId = [String]()

    for i in new_id.lowercased().map({String($0)}){
        if ["-","_"].contains(i){
            newId.append(i)
            addDotFlag = true
        }else if i == "." && addDotFlag == true{
            newId.append(i)
            addDotFlag = false
        }else if Int(i) != nil{
            newId.append(i)
            addDotFlag = true
        }else if i.range(of: "[a-z]", options: .regularExpression) != nil{
            newId.append(i)
            addDotFlag = true
        }
    }
    
    while newId.first == "."{
        newId.removeFirst()
    }
    while newId.last == "."{
        newId.removeLast()
    }
    if newId.isEmpty{
        newId.append("a")
    }
    if newId.count > 15{
        newId = Array(newId[0...14])
        while newId.last == "."{
            newId.removeLast()
        }
    }
    if newId.count <= 2{
        while newId.count != 3{
            newId.append(newId.last!)
        }
    }
    return newId.joined()
}
