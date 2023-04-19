//
//  main.swift
//  여행 경로
//
//  Created by 유현진 on 2023/04/13.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted{$0[1] < $1[1]}
    var visited = [Int]()
    var result = [String]()
    func dfs(last: String){
        if visited.count == tickets.count{
            result.append(last)
            return
        }
        for (offset,ticket) in tickets.enumerated(){
            if last == ticket[0]{
                if !visited.contains(offset){
                    result.append(last)
                    visited.append(offset)
                    dfs(last: ticket[1])
                    if visited.count == tickets.count{
                        return
                    }
                    result.removeLast()
                    visited.removeLast()
                }
            }
        }
    }
    dfs(last: "ICN")
    return result
}

print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
print(solution([["ICN", "BOO"], ["ICN", "COO"], ["COO", "DOO"], ["DOO", "COO"], ["BOO", "DOO"], ["DOO", "BOO"], ["BOO", "ICN"], ["COO", "BOO"]]))

//["ICN", "BOO", "DOO", "BOO", "ICN", "COO", "DOO", "COO", "BOO"]
