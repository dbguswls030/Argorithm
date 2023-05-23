//
//  main.swift
//  부녀회장이 될테야
//
//  Created by 유현진 on 2023/05/24.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    for _ in 0..<T{
        let k = Int(readLine()!)!
        let n = Int(readLine()!)!
        var result = 0
        var apart = [Int]()
        for i in 1...n{
            apart.append(i)
        }
        for _ in 0..<k{
            for i in 1..<n{
                apart[i] = apart[i-1] + apart[i]
            }
        }
        print(apart[n-1])
    }
}
solution()
