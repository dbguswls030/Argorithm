//
//  main.swift
//  피로도
//
//  Created by 유현진 on 2023/01/11.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var count = 0
    func dfs(k: Int, dungeons: [[Int]], dept: Int){
        
        for dungeon in dungeons {
            if k >= dungeon[0] {
                dfs(k: k - dungeon[1], dungeons: dungeons.filter({$0 != dungeon}), dept: dept+1)
            }
        }
        
    }
    dfs(k: k, dungeons: dungeons, dept: 0)
    return count
}


print(solution(80, [[80,20],[50,40],[30,10]]))
