//
//  main.swift
//  튜플
//
//  Created by 유현진 on 2023/09/05.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    var visited = Array(repeating: false, count: 100001)
    let startIndex = s.index(s.startIndex, offsetBy: 1)
    let endIndex = s.index(s.startIndex, offsetBy: s.count-1)
    var str = s[startIndex..<endIndex].replacingOccurrences(of: "{", with:"").split(separator:"}").sorted{$0.count < $1.count}
    
    for i in str{
        for j in i.split(separator: ","){
            if visited[Int(String(j))!] == false{
                result.append(Int(String(j))!)
                visited[Int(String(j))!] = true
            }
        }
    }
    return result
}

//print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
