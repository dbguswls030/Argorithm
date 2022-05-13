//
//  main.swift
//  2020 KAKAO BLIND RECRUITMENT  문자열 압축
//
//  Created by 유현진 on 2022/05/13.
//

import Foundation

//print(solution("xztjabcdabcd"))
//print(solution("aabbaccc"))
//print(solution("ababcdcdababcdcd"))
//print(solution("abcabcdede"))
//print(solution("abcabcabcabcdededededede"))
//print(solution("xababcdcdababcdcd"))
//print(solution("werwerwsdgsdfsdfsdf"))

//

func solution(_ s:String) -> Int {
    var resultLen = [Int]()
    for i in 1...s.count{
        resultLen.append(compp(len: i, sArr: s.map{String($0)}))
    }
    return resultLen.min()!
}

func compp(len: Int, sArr: [String]) -> Int{
    
    var index = 0
    var str = ""
    var result = ""
    var subCount = 0
    
    while index+len <= sArr.count{  // len만큼 될 수 있는대로 문자열에 대해 연산
        let curStr = sArr[index..<index+len].joined()
//        print(curStr)
        if str == curStr{
            subCount += 1
        }else{
            if subCount > 0{
                result += "\(subCount+1)\(str)"
                subCount = 0
            }else{
                result += "\(str)"
            }
            str = curStr
        }
        if index+len > sArr.count - 1 - sArr.count%len{
            break
        }else{
            index += len
        }
    }
    if subCount > 0{
        result += "\(subCount+1)\(sArr[index...sArr.endIndex-1].joined())"
        
    }else if subCount == 0 && index <= sArr.count - 1{
        result += "\(sArr[index...sArr.endIndex-1].joined())"
    }
//    print(result)
    return result.count
}
