//
//  main.swift
//  11404
//
//  Created by 유현진 on 11/19/24.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var city = Array(repeating: Array(repeating: 1000000 * 1000, count: n), count: n)
    
    for _ in 0..<m{
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let x = input[0] - 1
        let y = input[1] - 1
        city[x][y] = min(city[x][y], input[2])
    }
    for z in 0..<n{
        for x in 0..<n{
            for y in 0..<n{
                if x == y { continue }
                city[x][y] = min(city[x][y], city[x][z] + city[z][y])
            }
        }
    }
    for i in 0..<n{
        print(city[i].map{String($0 == 1000000 * 1000 ? 0 : $0)}.joined(separator: " "))
    }
}
solution()
