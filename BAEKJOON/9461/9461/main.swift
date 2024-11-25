//
//  main.swift
//  9461
//
//  Created by 유현진 on 11/25/24.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    var m = [1, 1, 1, 2, 2, 3]
    for _ in 0..<T{
        let N = Int(readLine()!)!
        if N > m.count{
            for i in m.count..<N{
                m.append(m[i-1] + m[i-5])
            }
            print(m[N-1])
        }else{
            print(m[N-1])
        }
    }
}
solution()
