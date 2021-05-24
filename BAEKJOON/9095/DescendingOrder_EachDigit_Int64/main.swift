//
//  main.swift
//  DescendingOrder_EachDigit_Int64
//
//  Created by 유현진 on 2021/04/26.
//

import Foundation


func solution(_ n: Int64) -> Int64{
    var arr: Array<Int64> = []
    var result = ""
    for i in String(n){
        arr.append(Int64(String(i))!)
    }
    
    arr.sort(by: <)
    _  = arr.map{ result = result + "\($0)"}
    
    return Int64(result)!
}

func solution2(_  n: Int64) -> Int64{
    return Int64(String(String(n).sorted(by: <)))!
}


print(solution(873211))
print(solution2(873291))
