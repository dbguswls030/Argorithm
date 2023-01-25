//
//  main.swift
//  비밀지도
//
//  Created by 유현진 on 2023/01/25.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for index in 0..<arr1.count {
        answer.append(compareArray(x: binary(n: n, num: arr1[index]), y: binary(n: n, num: arr2[index])))
    }
    return answer
}
func compareArray(x: [Int], y: [Int])->String{
    var result = ""
    for index in 0..<x.count{
        if x[index] == 0, y[index] == 0{
            result+=" "
        }else{
            result+="#"
        }
    }
    return result
}
func binary(n: Int, num: Int) -> [Int]{
    var result = [Int]()
    var n = n
    var num = num
    while n != 0{
        let i = Int(pow(2.0,Float(n-1)))
        if num / i > 0{
            num =  num % i
            result.append(1)
        }else{
            result.append(0)
        }
        n -= 1
    }
    return result
}
print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))

