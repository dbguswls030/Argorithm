//
//  main.swift
//  2800
//
//  Created by 유현진 on 7/18/25.
//

import Foundation



func solution() {
    let input = readLine()!.map { String($0) }
    var pair = [(Int,Int)]()
    var latest = [Int]()
    var result = Set<String>()

    for i in 0..<input.count {
        if input[i] == "(" {
            pair.append((i, -1))
            latest.append(pair.count - 1)
        } else if input[i] == ")" {
            pair[latest.removeLast()].1 = i
        }
    }



    for i in 1...(1<<pair.count)-1 {

        var temp = [(Int,Int)]()
        for j in 0..<pair.count {
            if (i & (1 << j)) != 0 {
                temp.append(pair[j])
            }
        }
        var tempInput = input

        for filter in temp {
            let open = filter.0
            let close = filter.1

            tempInput[open] = ""
            tempInput[close] = ""

        }
        result.insert(tempInput.joined())
    }
    result.sorted().forEach {
        print($0)
    }
}

solution()
