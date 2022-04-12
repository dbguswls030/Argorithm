//
//  main.swift
//  3085
//
//  Created by 유현진 on 2022/04/12.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var map = [[Character]]()
    let dx = [0,0,-1,1]
    let dy = [1,-1,0,0]
    var result = 0
    for _ in 0..<N{
        map.append(readLine()!.map{ $0 })
    }
    
    for i in 0..<N{
        for j in 0..<N{
            change(i: i, j: j)
        }
    }
    print(result)
    func change(i: Int, j: Int){
        let char = map[i][j]
        for d in 0..<4{
            let x = i+dx[d]
            let y = j+dy[d]
            if x>=0 && y>=0 && x < N && y < N{
                if map[x][y] != char{
                    // 위치 바꾸기
                    var temp = map[x][y]
                    map[x][y] = map[i][j]
                    map[i][j] = temp
                    
                    // dfs()
                    let retVal = max(col(),row())
                    if result < retVal{
                        result = retVal
                    }
                    // 위치 원위치
                    temp = map[x][y]
                    map[x][y] = map[i][j]
                    map[i][j] = temp
                }

            }
        }
    }
    
    
    func row()->Int{
        var max = 1
        for i in 0..<N{
            var char = map[0][i]
            var count = 0
            for j in 0..<N{
                if char == map[j][i]{
                    count+=1
                    if max < count {
                        max = count
                    }
                }else{
                    char = map[j][i]
                    count = 1
                }
            }
        }
        return max
    }
    
    func col() -> Int{
        var max = 1
        for i in 0..<N{
            var char = map[i][0]
            var count = 0
            for j in map[i]{
                if char == j{
                    count += 1
                    if max < count{
                        max = count
                    }
                }else{
                    char = j
                    count = 1
                }
                
            }
        }
        return max
    }
}
solution()
