//
//  main.swift
//  2660
//
//  Created by 유현진 on 12/8/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var friends = Array(repeating: Array(repeating: Int.max/50, count: N), count: N)
    var score = Array(repeating: 0, count: N)
    var result = [Int]()
    while true{
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        if input[0] == -1, input[1] == -1 { break }
        friends[input[0]-1][input[1]-1] = 1
        friends[input[1]-1][input[0]-1] = 1
    }
    for z in 0..<N{
        for x in 0..<N{
            for y in 0..<N{
                if x == y { continue }
                friends[x][y] = min(friends[x][y], friends[x][z] + friends[z][y])
            }
        }
    }
    for i in 0..<friends.count{
        score[i] = friends[i].filter{$0 != Int.max/50}.max()!
    }
    
    print(score.min()!, score.filter{$0 == score.min()!}.count)
    for (offset,i) in score.enumerated(){
        if i == score.min()!{
            result.append(offset+1)
        }
    }
    print(result.map{String($0)}.joined(separator: " "))
    
    
}
solution()
// 1-8
// 2-5
// 3-5
// 4-5
// 5-7
