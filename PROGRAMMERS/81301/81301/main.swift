//
//  main.swift
//  81301
//
//  Created by 유현진 on 2022/07/05.
//

import Foundation

print(solution("one4seveneight"))
func solution(_ s:String) -> Int {
    let dict = ["zero" : "0","one" : "1", "two": "2","three" : "3", "four" : "4","five" : "5","six" : "6","seven" : "7","eight" : "8","nine" : "9"]
    var str = s
    for i in dict{
        str = str.replacingOccurrences(of: i.key, with: i.value)
        
    }
    return Int(str)!
}

//func solution(_ s:String) -> Int {
//    let dict = ["zero","one","two","three","four","five","six","seven","eight","nine"]
//    var str = s
//    while str.range(of: "[a-z]", options: .regularExpression) != nil{
//        if let word = dict.first(where: {str.contains($0)}) {
//
//            str = str.replacingOccurrences(of: word, with: replacing(word: word))
//        }
//    }
//    return Int(str)!
//}
//
//func replacing(word: String) -> String{
//    switch word{
//    case "one": return "1"
//    case "two": return "2"
//    case "three": return "3"
//    case "four": return "4"
//    case "five": return "5"
//    case "six": return "6"
//    case "seven": return "7"
//    case "eight": return "8"
//    case "nine": return "9"
//    default: return "0"
//    }
//}
