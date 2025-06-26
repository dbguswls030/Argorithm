//
//  main.swift
//  16562
//
//  Created by 유현진 on 6/26/25.
//

//
import Foundation

func solution() {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0] // 학생 수
    let M = input[1] // 친구 관계 수
    let K = input[2] // 가지고 있는 돈

    var parent = [Int]()
    let cost = readLine()!.split(separator: " ").map { Int(String($0))! } // N명의 학생이 원하는 친구비

    for i in 0..<N { parent.append(i) }

    for _ in 0..<M {
        input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let v = input[0] - 1
        let w = input[1] - 1

        union(v, w)
    }

    var result = 0
    var visited = Array(repeating: false, count: N)

    for i in 0..<N {
        let cur = find(i)
        if !visited[cur] {
            result += cost[cur]
            visited[cur] = true
        }
    }

    if result > K {
        print("Oh no")
    } else {
        print(result)
    }

    func union(_ x: Int, _ y: Int) {
        let x = find(x)
        let y = find(y)
        if cost[x] >= cost[y] {
            parent[x] = y
        } else {
            parent[y] = x
        }
    }

    func find(_ a: Int) -> Int {
        if parent[a] == a {
            return a
        }
        return find(parent[a])
    }
}

solution()
