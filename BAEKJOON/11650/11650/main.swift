//
//  main.swift
//  11650
//
//  Created by 유현진 on 2022/04/06.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var point = Array(repeating: [Int](), count: N)
    
    for i in 0..<point.count{
        point[i] = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    }
//    point.sort(by: {$0[0] < $1[0] || ($0[0] == $1[0] && $0[1] < $1[1]) })
    point.sort { a, b in
        return a[0] < b[0] || (a[0] == b[0] && a[1] < b[1])
    }
    for i in point{
        print("\(i[0]) \(i[1])")
    }
}

solution()
