//
//  main.swift
//  미로 탐색
//
//  Created by 유현진 on 2023/01/26.
//

import Foundation

func solution(){
    var input = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[0]
    var map = [[Int]]()
    var queue = [(0,0)]
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    for _ in 0..<N{
        map.append(readLine()!.map{Int(String($0))!})
    }
    
    while !queue.isEmpty{
        let p = queue.removeFirst()
        let x = p.0
        let y = p.1
        
        if x == N - 1, y == M{
            print(map[x][y])
        }
    }
    
}
