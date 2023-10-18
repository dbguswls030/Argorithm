//
//  main.swift
//  최소 스패닝 트리
//
//  Created by 유현진 on 2023/10/18.
//

import Foundation

func solution(){
    var result: Int64 = 0
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0]
    let v = input[1]
    var costs = [[Int]]()
    for _ in 0..<v{
        costs.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    var parent = [Int]()
    (0...v).forEach({parent.append($0)})
    
    
    func find(i: Int) -> Int{
        if parent[i] == i{
            return i
        }else{
            return find(i: parent[i])
        }
    }
    
    func union(a: Int, b: Int) -> Bool{
        let aa = find(i: a)
        let bb = find(i: b)
        
        if aa == bb{
            return false
        }else{
            if aa < bb{
                parent[bb] = aa
            }else{
                parent[aa] = bb
            }
            return true
        }
        
    }
    for cost in costs.sorted(by: {$0[2] < $1[2]}){
        let a = cost[0] - 1
        let b = cost[1] - 1
        let value = cost[2]
        
        if union(a: a, b: b){
            result += Int64(value)
        }
    }
    print(result)
}
solution()
