//
//  main.swift
//  숫자 짝꿍
//
//  Created by 유현진 on 2023/01/11.
//

import Foundation


//func solution(_ X:String, _ Y:String) -> String {
//    // 공통 정수 찾기
//    let unionCountArr = getUnionInt(x: X, y: Y)
//    // 최대 값 만들기
//    return getMax(arr: unionCountArr)
//}
//func getUnionInt(x: String, y: String) -> [Int]{
//    var result = Array(repeating: 0, count: 10)
//    var rights = y
//    for left in x {
//        if let index = rights.firstIndex(of: left){
//            result[Int(String(left))!] += 1
//            rights.remove(at: index)
//        }
//    }
//    return result
//}
//func getMax(arr: [Int]) -> String{
//    var result = ""
//    for (index, value) in arr.reversed().enumerated(){
//
//        for _ in 0..<Int(String(value))!{
//            result += String(9-index)
//        }
//    }
//    if result == ""{
//        return "-1"
//    }else if !result.contains(where: {$0 != "0"}){
//        return "0"
//    }
//    return result
//}
func solution(_ X:String, _ Y:String) -> String {
    // 공통 정수 찾기
    var str = ""
    for i in stride(from: 9, through: 0, by: -1){
        let x = X.filter{String($0) == String(i)}.count
        let y = Y.filter{String($0) == String(i)}.count
        for _ in 0..<min(x, y){
            str += String(i)
        }
    }
    
    if str.isEmpty {return "-1"}
    else if !str.contains(where: {$0 != "0"}){ return "0"}
    else{ return str }
    
}


print(solution("100", "2345"))
print(solution("100", "203045"))
print(solution("100", "123450"))
print(solution("12321", "42531"))
print(solution("5525", "1255"))
