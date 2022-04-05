//
//  main.swift
//  11725
//
//  Created by 유현진 on 2022/04/05.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var queue = [1]
    var result = Array(repeating: 0, count: n+1)
    var node = Array(repeating: [Int](), count: n+1)
    for i in 0..<n-1{
        let input = readLine()!.components(separatedBy: " ").map {Int(String($0))!}
        node[input[0]].append(input[1])
        node[input[1]].append(input[0])
    }
    while queue.count != 0{
        let parent = queue.removeFirst()
        for child in node[parent]{
            if result[child] == 0 && child != 1{
                queue.append(child)
                result[child] = parent
            }
        }
    }
    for i in 2..<result.count{
        print(result[i])
    }
}
solution()
