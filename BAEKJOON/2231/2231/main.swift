//
//  main.swift
//  2231
//
//  Created by 유현진 on 2021/11/17.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var result = 0
    for i in (0..<N).reversed(){
        var sum = i
        var k = i
        while k / 10 != 0{
            sum += k % 10
            k /= 10
        }
        sum += k
        if sum == N{
            result = i
        }
    }
    print(result)
}
solution()

