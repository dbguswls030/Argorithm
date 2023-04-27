//
//  main.swift
//  11053
//
//  Created by 유현진 on 2023/04/27.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    let A = readLine()!.split(separator: " ").map{Int(String($0))!}
    var len = Array(repeating: 1, count: n)
    for i in 0..<n{
        for j in 0..<i{
            if A[i] > A[j] {
                len[i] = max(len[i], len[j]+1)
            }
        }
    }
    print(len.max()!)
}
solution()
