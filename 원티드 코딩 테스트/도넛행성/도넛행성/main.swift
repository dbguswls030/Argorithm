//
//  main.swift
//  도넛행성
//
//  Created by 유현진 on 2023/01/14.
//

import Foundation

func solution(width: Int, height: Int){
    var count = 0
    var planet = [[Int]]()
    for _ in 0..<width{
        planet.append( readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    for x in 0..<width+1{
        for y in 0..<height+1{
            if planet[x%width][y%height] == 0 {
                count += 1
                dfs(x: x%width, y: y%height)
            }
        }
    }
    
    func dfs(x: Int, y: Int){
        planet[x][y] = 1
        let dx = [0,0,-1,1]
        let dy = [-1,1,0,0]
        for i in 0..<4{
            if planet[((x+dx[i])+width) % width][((y+dy[i]) + height) % height] == 0{
                dfs(x: ((x+dx[i])+width) % width, y: ((y+dy[i]) + height) % height)
            }
        }
    }
    print(count)
}
var size = readLine()!.split(separator: " ").map { Int(String($0))! }
solution(width: size[0], height: size[1])
