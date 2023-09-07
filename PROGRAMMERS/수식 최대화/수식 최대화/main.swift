//
//  main.swift
//  수식 최대화
//
//  Created by 유현진 on 2023/09/07.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    var result: Int64 = 0
    var str = [String]()
    var op = Set<String>()
    var temp = ""
    for e in expression{
        if Int(String(e)) != nil{
            temp += String(e)
        }else{
            str.append(temp)
            temp = ""
            op.insert(String(e))
            str.append(String(e))
        }
    }
    str.append(temp)
    let oop = Array(op)
    
    func calc(list: [String], oper: String) -> [String]{
        var returnList = [String]()
        var index = 0
        var f = false
        while index < list.count{
            
            if list[index] == oper{
                var left = Int64(list[index-1])!
                if f {
                    left = Int64(returnList[returnList.count - 1])!
                    f = false
                }
                let right = Int64(list[index+1])!
                var r: Int64 = 0
                if oper == "+"{
                    r = left + right
                }else if oper == "-"{
                    r = left - right
                }else{
                    r = left * right
                }
                returnList[returnList.count - 1] = String(r)
                f = true
                index += 2
                
            }else{
                returnList.append(list[index])
                index += 1
                
            }
        }
        return returnList
    }
    func dfs(list: [String], visited: [Bool]){
        if list.count == 1{
            result = max(abs(result), abs(Int64(list[0])!))
            return
        }
        var visited = visited
        for (offset, i) in oop.enumerated(){
            if visited[offset] == false{
                visited[offset] = true
                dfs(list: calc(list: list, oper: i), visited: visited)
                visited[offset] = false
            }
            
        }
    }
    dfs(list: str, visited: Array(repeating: false, count: oop.count))
    
    return abs(result)
}

print(solution("100-200*300-500+20"))
print(solution("50*6-3*2"))
print(solution("50+5-5"))
