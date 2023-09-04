//
//  main.swift
//  하노이의 탑
//
//  Created by 유현진 on 2023/09/04.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result = [[Int]]()
    
    func dfs(n: Int, start: Int, to: Int, mid: Int){
        if n == 1 {
            result.append([start,to])
            return
        }
        dfs(n: n-1, start: start, to: mid, mid: to)
        result.append([start, to])
        dfs(n: n-1, start: mid, to: to, mid: start)
    }
    dfs(n: n, start: 1, to: 3, mid: 2)
    return result
}

print(solution(2))
