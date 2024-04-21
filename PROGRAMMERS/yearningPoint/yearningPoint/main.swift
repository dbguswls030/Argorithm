//
//  main.swift
//  yearningPoint
//
//  Created by 유현진 on 4/21/24.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dict: [String:Int] = [:]
    var result = [Int]()
    for i in 0..<name.count{
       dict[name[i]] = yearning[i]
    }
    for p in photo{
        var point = 0
        for i in p{
            if let a = dict[i]{
                point += a
            }
        }
        result.append(point)
    }
    return result
}
