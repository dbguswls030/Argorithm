//
//  main.swift
//  9461
//
//  Created by 유현진 on 2022/03/07.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    var m = [Int]()
    m.append(1)
    m.append(1)
    m.append(1)
    m.append(2)
    m.append(2)
    
    for _ in 0..<T{
        fib()
    }
    
    func fib(){
        let N = Int(readLine()!)!
        let count = m.count
        if N>count{
            for i in count..<N{
                m.append(m[i-1]+m[i-5])
            }
        }
        print(m[N-1])
    }
}
solution()
