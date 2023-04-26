//
//  main.swift
//  dp피보나치
//
//  Created by 유현진 on 2023/04/26.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    
    var d = [0, 1]
    for i in 2...40{
        d.append(d[i-1] + d[i-2])
    }
    
    print(d[n], n-2)
}
solution()
