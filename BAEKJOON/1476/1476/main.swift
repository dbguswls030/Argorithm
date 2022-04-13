//
//  main.swift
//  1476
//
//  Created by 유현진 on 2022/04/13.
//

import Foundation

func solution(){
    // E S M
    // (1 ≤ E ≤ 15, 1 ≤ S ≤ 28, 1 ≤ M ≤ 19)
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let E = input[0]
    let S = input[1]
    let M = input[2]
    
    var e = 1
    var s = 1
    var m = 1
    var n = 1
    while true{
        if e > 15{
            e = 1
        }
        if s > 28{
            s = 1
        }
        if m > 19{
            m = 1
        }
        if e == E, s == S, m == M{
            print(n)
            break
        }
        e += 1
        s += 1
        m += 1
        n += 1
    }
}
solution()
