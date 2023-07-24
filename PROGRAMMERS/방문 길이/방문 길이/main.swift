//
//  main.swift
//  방문 길이
//
//  Created by 유현진 on 2023/07/24.
//

import Foundation

func solution(_ dirs:String) -> Int {
    var visited: Set<String> = []
    var index = (0,0)
    var result = 0
    for i in dirs{
        var temp = (0,0)
        var changeFlag = false
        if i == "U"{
            if index.1 < 5{
                temp = (index.0,index.1+1)
                changeFlag = true
            }
        }else if i == "D"{
            if index.1 > -5{
                temp = (index.0,index.1-1)
                changeFlag = true
            }
        }else if i == "L"{
            if index.0 > -5{
                temp = (index.0-1,index.1)
                changeFlag = true
            }
        }else if i == "R"{
            if index.0 < 5{
                temp = (index.0+1,index.1)
                changeFlag = true
            }
        }
        if changeFlag{
            if !visited.contains("\(index.0),\(index.1)-\(temp.0),\(temp.1)") || !visited.contains("\(temp.0),\(temp.1)-\(index.0),\(index.1)"){
                visited.insert("\(index.0),\(index.1)-\(temp.0),\(temp.1)")
                visited.insert("\(temp.0),\(temp.1)-\(index.0),\(index.1)")
                result += 1
            }
            index = temp
        }
    }
    return result
}

print(solution("ULURRDLLU"))
print(solution("LULLLLLLU"))
print(solution("RRRRRRRRU"))
print(solution("UDU"))
