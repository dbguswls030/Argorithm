//
//  main.swift
//  피로도
//
//  Created by 유현진 on 4/2/25.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var count = 0
    
    func dfs(k: Int,  visited: [Bool], dept: Int){
        var visited = visited
        if count < dept{ count = dept }
        
        for (offset, dungeon) in dungeons.enumerated(){
            if visited[offset] == false{
                if k >= dungeon[0]{
                    visited[offset] = true
                    dfs(k: k-dungeon[1], visited: visited, dept: dept+1)
                    visited[offset] = false
                }
            }
        }
    }
    
    dfs(k: k, visited: Array(repeating: false, count: dungeons.count), dept: 0)
    return count
}
