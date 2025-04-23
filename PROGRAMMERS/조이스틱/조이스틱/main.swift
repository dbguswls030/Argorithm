//
//  main.swift
//  조이스틱
//
//  Created by 유현진 on 4/16/25.
//

import Foundation

func solution(_ name:String) -> Int {
    let name = name.map { Character(String($0)) }

    var updown = 0 // 상하 알파벳 이동

    for spell in name {
        updown += min(
            Int(spell.asciiValue!) - Int(Character("A").asciiValue!),
            Int(Character("Z").asciiValue!) + 1 - Int(spell.asciiValue!)
        )
    }

    var leftToRightMove = name.count - 1

    for start in 0..<name.count {
        var end = start + 1
        while end < name.count && name[end] == "A" {
            end += 1
        }
        // 0 -> start -> 0 -> end
        let moveFront = (start * 2) + (name.count - end)

        // 0 -> end -> 0 -> start
        let moveBack = (name.count - end) * 2 + start

        leftToRightMove = min(moveBack, moveFront, leftToRightMove)
    }

    return updown + leftToRightMove
}

//print(solution("JEROEN")) //56
//print(solution("JAN")) // 23
print(solution("JAAOEN"))
