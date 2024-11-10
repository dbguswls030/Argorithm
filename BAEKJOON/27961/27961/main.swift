//
//  main.swift
//  27961
//
//  Created by 유현진 on 11/10/24.
//

import Foundation

func solution(){
    let N = Int64(readLine()!)!
    var cat = 1
    var count = 0
    while cat < N{
        cat *= 2
        count += 1
    }
    print(N == 0 ? 0 : count+1)
}
solution()
