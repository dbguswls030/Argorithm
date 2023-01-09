//
//  main.swift
//  옹알이2
//
//  Created by 유현진 on 2023/01/06.
//

import Foundation
func solution(_ babbling:[String]) -> Int {
    let voice = ["aya", "ye", "woo", "ma"]
    var count = 0
    for i in babbling{
        var word = i
        for v in voice{
            if let range = word.firstRange(of: v){
                word.removeSubrange(range)
            }
        }
        if word == ""{
            count += 1
        }
    }
    return count
}

print(solution(["aya", "yee", "u", "maa"]))
print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
