//
//  main.swift
//  내적
//
//  Created by 유현진 on 2023/02/17.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for i in 0..<a.count{
        result += a[i] * b[i]
    }
    return result
}

