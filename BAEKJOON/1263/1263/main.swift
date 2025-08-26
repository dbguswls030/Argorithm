//
//  main.swift
//  1263
//
//  Created by 유현진 on 8/26/25.
//

import Foundation

func solution() {
    let N = Int(readLine()!)!
    var task = [(Int, Int)]()

    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        task.append((input[0], input[1]))
    }

    task.sort { $0.1 > $1.1 }
    var result = 1000001

    for j in task {
        let needTime = j.0
        let limitTime = j.1

        result = min(result, limitTime)
        result -= needTime
    }
    print(result >= 0 ? result : -1)
}

solution()

// t 작업에 걸리는 시간
// s s 시내에 이 일을 처리해야 한다.
//4
//1 20
//3 21
//6 22
//10 23

//4
//3 5
//8 14
//1 16
//5 20

// 2 3 4 5
// 5 6 7 8 9 10 11
//
