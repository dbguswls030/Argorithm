//
//  main.swift
//  괄호 회전하기
//
//  Created by 유현진 on 2023/07/19.
//

import Foundation

func solution(_ s:String) -> Int {
    var index = 0
    var s = s
    var result = 0
    func isClosed(c: Character) -> Bool{
        if c == "]" || c == "}" || c == ")"{
            return true
        }
        return false
    }
    func check() -> Bool{
        var stack = ""
        
        
        for (offset,i) in s.enumerated(){
            var isOpenClosedFlag = false
            if stack.isEmpty{
                stack.append(i)
                continue
            }
            if isClosed(c: i){
                if stack.last == "("{
                    if i == ")"{
                        isOpenClosedFlag = true
                    }
                }else if stack.last == "["{
                    if i == "]"{
                        isOpenClosedFlag = true
                    }
                }else if stack.last == "{"{
                    if i == "}"{
                        isOpenClosedFlag = true
                    }
                }
            }else{
                stack.append(i)
            }
            
            if isOpenClosedFlag{
                stack.removeLast()
            }
            
        }
        return stack.isEmpty ? true : false
    }
    
    while index < s.count{
        if check(){
            result += 1
//            print("+ 1 \(s)")
        }
        index += 1
        s.append(s.removeFirst())
    }
    return result
}

//print(solution("[](){}"))
//print(solution("}]()[{"))
//print(solution("[)(]"))
//print(solution("}}}"))
print(solution("(){{))"))
print(solution("(){{]]"))
