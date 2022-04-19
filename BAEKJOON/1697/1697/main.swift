//
//  main.swift
//  1697
//
//  Created by 유현진 on 2022/04/19.
//


import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let N = input[0]
    let K = input[1]
    var q = [(Int,Int)]()
    var v = Array(repeating: true, count: 100001)
    
    bfs(p: (N, 0))
    
    func bfs(p: (Int, Int)){
        let dot = p.0
        let s = p.1
//        print(p)
        
        if dot == K{
            print(p.1)
            return
        }
        if dot - 1 >= 0 && v[dot - 1]{
            q.append((dot - 1, s+1))
            v[dot - 1] = false
        }
        if dot + 1 <= 100000 && v[dot + 1]{
            q.append((dot + 1, s+1))
            v[dot + 1] = false
        }
        if dot * 2 <= 100000 && v[dot * 2]{
            q.append((dot * 2, s+1))
            v[dot * 1] = false
        }
        bfs(p: (q.removeFirst()))
    }
}
solution()
