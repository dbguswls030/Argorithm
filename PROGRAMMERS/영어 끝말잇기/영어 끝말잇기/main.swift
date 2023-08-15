//
//  main.swift
//  영어 끝말잇기
//
//  Created by 유현진 on 2023/08/15.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var player = Array(repeating: 0, count: n)
    var visited = [String]()
    for (offset, word) in words.enumerated(){
        player[offset%n] += 1
        if visited.contains(word){
            return [offset % n + 1, player[offset%n]]
        }else if !visited.isEmpty, visited.last?.last != word.first{
            return [offset % n + 1, player[offset%n]]
        }else{
            visited.append(word)
        }
    }
    return [0,0]
}

print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))
print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
