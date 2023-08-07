//
//  main.swift
//  [3차] 압축
//
//  Created by 유현진 on 2023/08/03.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var dict = [String : Int]()
    for i in 1...26{
        dict[String(UnicodeScalar(i+64)!)] = i
    }
    let msg = msg.map{String($0)}
    var start = 0
    var end = 0
    var maxValue = 27
    var result = [Int]()
    while start < msg.count{
//        print("start: \(start), end: \(end)")
//        print("result \(result)")
//        print(dict[msg[start]], msg[start...end])
        var elseflag = false
        while end < msg.count{
//            print(msg[start...end].joined())
            if end < msg.count, dict[msg[start...end].joined()] == nil{
                elseflag = true
                dict[msg[start...end].joined()] = maxValue
                maxValue += 1
//                print("add key : \(msg[start...end].joined()), value : \(dict[msg[start...end].joined()])")
                result.append(dict[msg[start..<end].joined()]!)
                start = end
                break
            }
            end += 1
        }
        if elseflag == false{
//            print("elseFlag")
//            print("start: \(start), end: \(end)")
            result.append(dict[msg[start..<end].joined()]!)
            start = end
            
        }
        
        
    }
    return result
}

print(solution("KAKAO"))
print(solution("TOBEORNOTTOBEORTOBEORNOT"))
print(solution("ABABABABABABABAB"))
