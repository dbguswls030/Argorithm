//
//  main.swift
//  2667
//
//  Created by 유현진 on 2022/03/31.
//

import Foundation
struct Location{
    let x: Int
    let y: Int
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}

func solution(){
    let N = Int(readLine()!)!
    var map = [[Int]]()
    for i in 0..<N{
        map.append([Int]())
        map[i] = Array(readLine()!).map{Int(String($0))!}
        
    }
    
    var v = Array(repeating: Array(repeating: 0, count: N), count: N)
    var stack = [Location]()
    var result = [Int]()
    
    for i in 0..<map.count{
        for j in 0..<map[i].count{
            if map[i][j] == 1, v[i][j] == 0{
                stack.append(Location(x: i, y: j))
                result.append(1)
                dfs(location: stack.removeLast())
                
            }
        }
    }
    print(result.count)
    result.sort()
    for i in result{
        print(i)
    }
    
    func dfs(location: Location){
        let dx = [0,-1,1,0]
        let dy = [1,0,0,-1]
        let x = location.x
        let y = location.y
        v[x][y] = 1
        for i in 0..<4{
            if x+dx[i]<N, x+dx[i]>=0, y+dy[i]<N, y+dy[i]>=0{
                if map[x+dx[i]][y+dy[i]] == 1, v[x+dx[i]][y+dy[i]] == 0{
                    stack.append(Location(x: x+dx[i], y: y+dy[i]))
                    result[result.count-1] += 1
                    dfs(location: stack.removeLast())
                }
            }
            
        }
        
    }
    
}
solution()
