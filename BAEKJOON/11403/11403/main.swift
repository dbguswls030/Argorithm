//
//  main.swift
//  11403
//
//  Created by 유현진 on 12/5/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var map = [[Int]]()
    for _ in 0..<N{
        map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    for z in 0..<N{
        for x in 0..<N{
            for y in 0..<N{
                if map[x][z] == 1, map[z][y] == 1{
                    map[x][y] = 1
                }
            }
        }
    }
    
    for i in 0..<map.count{
        print(map[i].map{String($0)}.joined(separator: " "))
    }
}
solution()
