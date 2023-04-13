//
//  main.swift
//  단어 변환
//
//  Created by 유현진 on 2023/04/06.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let len = begin.count
    var result = 9999
    
    func dfs(cur: String, visited: [Bool], dept: Int){
        var visited = visited
        for (offset, word) in words.enumerated() {
            if isChangable(a: word, b: cur), visited[offset] == true{
                if word == target{
                    if result > dept + 1{
                        result = dept + 1
                    }
                    return
                }
                visited[offset] = false
                dfs(cur: word ,visited: visited, dept: dept+1)
            }
            
        }
    }
    func isChangable(a: String, b: String) -> Bool{
        let a = a.map{String($0)}
        let b = b.map{String($0)}
        var count = 0
        for i in 0..<len{
            if a[i] != b[i]{
                count += 1
            }
        }
        if count == 1{
            return true
        }else{
            return false
        }
    }
    for (offset, word) in words.enumerated() {
        if isChangable(a: word, b: begin){
            if word == target{
                return 1
            }
            var visited = Array(repeating: true, count: words.count)
            visited[offset] = false
            dfs(cur: word, visited: visited, dept: 1)
        }
        
    }
    
    
    return result == 9999 ? 0 : result
}
print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
//print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"]))
