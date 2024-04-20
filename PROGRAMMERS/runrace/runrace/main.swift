//
//  main.swift
//  runrace
//
//  Created by 유현진 on 4/20/24.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var players = players
    var playerDict: [String : Int] = [:]
    for (offset, item) in players.enumerated() {
        playerDict[item] = offset
    }
    
    for calling in callings {
        if let i = playerDict[calling]{
            let t = players[i]
            let h = players[i-1]
            
            players.swapAt(i, i-1)
            
            playerDict[h]! += 1
            playerDict[calling]! -= 1
            
        }
    }
    
    return players
}

print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
