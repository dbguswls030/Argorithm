//
//  main.swift
//  스킬트리
//
//  Created by 유현진 on 2023/07/25.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    let skill = skill.map{$0}
    for t in skill_trees{
        var index = 0
        var isValid = true
        for l in t{
            if skill.contains(l){
                if skill[index] != l{
                    isValid = false
                    break
                }
                index += 1
            }
        }
        if isValid{
            result += 1
        }
    }
    return result
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
