//
//  main.swift
//  2020 KAKAO BLIND RECRUITMENT 괄호 변환 괄호변환
//
//  Created by 유현진 on 2022/05/31.
//

import Foundation
print(solution("(()())()"))
print(solution(")("))
print(solution("()))((()"))
print(solution("))(()("))
func solution(_ p:String) -> String {
    func recursion(_ pA: [String]) -> String{
        if pA.isEmpty{
            return ""
        }
        if rightStr(pA){
            return pA.joined(separator: "")
        }
        
        var u = balanceStr(pA)
        var v = [String]()
        if pA.count != u.count{
            v = [String](pA[u.count...pA.endIndex-1])
        }
        if rightStr(u){
            return u.joined(separator: "") + recursion(v)
        }else{
            u.removeFirst()
            u.removeLast()
            for i in 0..<u.count{
                if u[i] == "("{
                    u[i] = ")"
                }else{
                    u[i] = "("
                }
            }
            return "("+recursion(v)+")"+u.joined()
        }
    }
    
    func balanceStr(_ pA: [String]) -> [String]{
        var index = 0
        var left = 0
        var right = 0
        
        repeat{
            if pA[index] == "("{
                left += 1
            }else{
                right += 1
            }
            index += 1
        }while(left != right && index < pA.count)
        return [String](pA[0...index-1])
    }
    
    func rightStr(_ pA: [String]) -> Bool{
        var stack = [String]()
        var top = -1
        stack.append(pA.first!)
        top += 1
        for i in 1..<pA.count{
            if top < 0{
                stack.append(pA[i])
                top += 1
            }else{
                if stack[top] == "(" && pA[i] == ")"{
                    stack.removeLast()
                    top -= 1
                }else{
                    stack.append(pA[i])
                    top += 1
                }
            }
            
        }
        
        return top == -1 ? true : false
    }
    let pArr = p.map{String($0)}
    
    return recursion(pArr)
}
