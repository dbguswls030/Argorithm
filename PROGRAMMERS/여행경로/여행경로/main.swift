//
//  main.swift
//  여행경로
//
//  Created by 유현진 on 3/12/25.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted{$0[1] < $1[1]} // 알파벳 순서 오름차순
    var visited = [Int]()
    var result = [String]()

    func dfs(cur: String){
        if visited.count == tickets.count{
            result.append(cur)
            return
        }
        
        for (offset,ticket) in tickets.enumerated(){
            if cur == ticket[0]{
                if !visited.contains(offset){
                    
                    result.append(cur)
                    visited.append(offset)
                    
                    dfs(cur: ticket[1])
                    
                    if visited.count == tickets.count{ // 주어진 항공권을 모두 사용한 경우 리턴
                        return
                    }
                    
                    result.removeLast()
                    visited.removeLast()
                }
            }
        }
    }
    dfs(cur: "ICN") // 출발 경로 ICN
    return result
}
print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))

