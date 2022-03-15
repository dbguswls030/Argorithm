//
//  main.swift
//  1932
//
//  Created by 유현진 on 2022/03/15.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var t = [[Int]]()
    var tt = [[Int]]()
    for i in 0..<N{
        t.append([Int]())
        t[i] = readLine()!.components(separatedBy: " ").map() {Int(String($0))!}
    }
    tt = t
    print(tt)
    for i in 0..<t.count-1{
        for j in 0..<t[i].count{
            tt[i+1][j] = max(tt[i+1][j], tt[i][j] + t[i+1][j])
            tt[i+1][j+1] = max(tt[i+1][j+1], tt[i][j] + t[i+1][j+1])
        }
    }
    print(tt)
    print(tt[N-1].max()!)
}
solution()

