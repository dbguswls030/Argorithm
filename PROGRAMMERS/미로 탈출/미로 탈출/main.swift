//
//  main.swift
//  미로 탈출
//
//  Created by 유현진 on 2023/06/30.
//

import Foundation

func solution(_ maps:[String]) -> Int {
    var m = [[String]]()
    
    let x = [0,0,1,-1]
    let y = [1,-1,0,0]
    
    var isPullLever = false
    var leverPoint = (0,0)
    var result = 0
    var isVisitedExit = false
    for map in maps {
        m.append(map.map{String($0)})
    }
    
    func findStart() -> (Int,Int){
        for i in 0..<m.count{
            for j in 0..<m[i].count{
                if m[i][j] == "S"{
                    return (i,j)
                }
            }
        }
        return (0,0)
    }
    
    func leverBfs(q: [(Int,Int)], dept: Int, visited: [[Bool]]){
        result = dept
        var q = q
        var next = [(Int,Int)]()
        var visited = visited
        while !q.isEmpty{
            let cur = q.removeFirst()
            visited[cur.0][cur.1] = true
            for i in 0..<4{
                let dx = cur.0 + x[i]
                let dy = cur.1 + y[i]
                if dx < 0 || dy < 0 || dx > m.count - 1 || dy > m[0].count - 1 || m[dx][dy] == "X"{
                    continue
                }
                if visited[dx][dy] == false{
                    if m[dx][dy] == "L"{
                        result += 1
                        leverPoint = (dx,dy)
                        isPullLever = true
                        return
                    }
                    next.append((dx,dy))
                    visited[dx][dy] = true
                }
            }
        }
        if !next.isEmpty{ leverBfs(q: next, dept: dept + 1, visited: visited)}
    }
  
    func exitBfs(q: [(Int,Int)], dept: Int, visited: [[Bool]]){
        result = dept
        var q = q
        var next = [(Int,Int)]()
        var visited = visited
        while !q.isEmpty{
            let cur = q.removeFirst()
            visited[cur.0][cur.1] = true
            for i in 0..<4{
                let dx = cur.0 + x[i]
                let dy = cur.1 + y[i]
                if dx < 0 || dy < 0 || dx > m.count - 1 || dy > m[0].count - 1 || m[dx][dy] == "X"{
                    continue
                }
                if visited[dx][dy] == false{
                    if m[dx][dy] == "E"{
                        isVisitedExit = true
                        result += 1
                        return
                    }
                    next.append((dx,dy))
                    visited[dx][dy] = true
                }
            }
        }
        if !next.isEmpty{ exitBfs(q: next, dept: dept + 1, visited: visited)}
    }
    
    leverBfs(q: [findStart()], dept: 0, visited: Array(repeating: Array(repeating: false, count: m[0].count), count: m.count))
    
    if isPullLever{
        exitBfs(q: [leverPoint], dept: result, visited: Array(repeating: Array(repeating: false, count: m[0].count), count: m.count))
        if isVisitedExit == true{
            return result
        }else{
            return -1
        }
    }else{
        return -1
    }
}
print(solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]))
print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))

