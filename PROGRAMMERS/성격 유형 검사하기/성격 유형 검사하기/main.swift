//
//  main.swift
//  성격 유형 검사하기
//
//  Created by 유현진 on 2023/01/11.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let score = [0, 3, 2, 1, 0, 1, 2, 3]
    var dict = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    for (index, value) in survey.enumerated(){
        let s = value.map{$0}
        let left = String(s[0])
        let right = String(s[1])
        if choices[index] < 4{
            dict[left]! += score[choices[index]]
        }else if choices[index] > 4{
            dict[right]! += score[choices[index]]
        }
    }
    var result = ""
    result += compareCount(a: ("R", dict["R"]!), b: ("T", dict["T"]!))
    result += compareCount(a: ("C", dict["C"]!), b: ("F", dict["F"]!))
    result += compareCount(a: ("J", dict["J"]!), b: ("M", dict["M"]!))
    result += compareCount(a: ("A", dict["A"]!), b: ("N", dict["N"]!))
    return result
}

func compareCount(a:(String,Int), b:(String,Int) ) -> String{
    if a.1 == b.1 {
        return a.0 > b.0 ? b.0 : a.0
    }else if a.1 > b.1{
        return a.0
    }else{
        return b.0
    }
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
print(solution(["TR", "RT", "TR"], [7, 1, 3]))
