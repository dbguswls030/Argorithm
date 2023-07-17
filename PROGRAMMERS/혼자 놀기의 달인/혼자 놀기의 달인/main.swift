//
//  main.swift
//  혼자 놀기의 달인
//
//  Created by 유현진 on 2023/06/19.
//

import Foundation

func solution(_ cards:[Int]) -> Int {
    var dp = Array(repeating: 0, count: cards.count + 1)
    var visited = Array(repeating: false, count: cards.count + 1)
    var result = [Int]()
    func dfs(dept: Int, num: Int){
        visited[num] = true
        result[result.count-1] = dept
        if visited[cards[num - 1]] == false{
            dfs(dept: dept + 1, num: cards[num - 1])
        }
    }
    
    for card in cards{
        if visited[card] == false{
            result.append(0)
            dfs(dept: 1, num: card)
        }
    }
    result.sort(by: >)
    if result.count < 2{
        return 0
    }
    return result[0] * result[1]
}
print(solution([8,6,3,7,2,5,1,4]))
