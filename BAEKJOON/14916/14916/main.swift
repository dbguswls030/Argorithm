//
//  main.swift
//  14916
//
//  Created by 유현진 on 11/11/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var result = Int.max
    
    for i in (0...N/5).reversed(){
        if (N - i * 5) % 2 == 0{
            result = (N - i * 5) / 2 + i
            break
        }
    }
    print(result == Int.max ? -1 : result)
}
solution()
