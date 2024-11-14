//
//  main.swift
//  2212
//
//  Created by 유현진 on 11/14/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    let K = Int(readLine()!)!
    if N <= K {
        print(0)
        return
    }
    let m = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    var desc = [Int]()
    for i in 0..<m.count-1{
        desc.append(m[i+1] - m[i])
    }
    desc.sort(by: >)
    print(desc[K-1..<desc.count].reduce(0, +))
}
solution()
