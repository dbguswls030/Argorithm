//
//  main.swift
//  43162
//
//  Created by 유현진 on 2023/03/30.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var net = Array(repeating: [Int](), count: n+1)
    var stack = [Int]()
    var v = Array(repeating: true, count: n+1)
    var result = 0
    func dfs(){
        let start = stack.removeLast()
        for end in net[start]{
            if v[end] == true{
                v[end] = false
                stack.append(end)
                dfs()
            }
        }
    }
    for (offset, computer)in computers.enumerated() {
        for (index, node) in computer.enumerated(){
            if offset == index { continue }
            if node == 1 {
                net[offset+1].append(index+1)
            }
        }
    }
//    print(net[1...n])
    
    for i in 1...n{
        if !net[i].isEmpty{
            if v[i] == true {
                v[i] = false
                stack.append(i)
                result += 1
                dfs()
            }
        }else{
            result += 1
        }
    }
    
    
    
    return result
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
