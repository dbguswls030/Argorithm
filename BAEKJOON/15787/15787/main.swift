//
//  main.swift
//  15787
//
//  Created by 유현진 on 7/23/25.
//

import Foundation

func solution() {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0]
    let M = input[1]
    var train = Array(repeating: 0, count: N)

    for _ in 0..<M {
        input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if input[0] == 1 || input[0] == 2 {
            order(order: input[0], i: input[1], x: input[2])
        } else {
            order(order: input[0], i: input[1], x: nil)
        }
    }

    func order(order: Int, i: Int, x: Int?) {
        if order == 1 {
            train[i-1] |= 1 << (x!-1)
        } else if order == 2 {
            train[i-1] &= ~(1 << (x!-1))
        } else if order == 3 {
            train[i-1] = (train[i-1] << 1) & ((1<<20)-1)
        } else if order == 4 {
            train[i-1] = (train[i-1] >> 1) & ((1<<20)-1)
        }
    }

    var visited = [Int]()

    for t in train {
        if visited.isEmpty {
            visited.append(t)
        } else {
            if visited.contains(t) {
                continue
            } else {
                visited.append(t)
            }
        }
    }
    print(visited.count)
}

solution()
