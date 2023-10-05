//
//  main.swift
//  이중우선순위큐
//
//  Created by 유현진 on 2023/10/04.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    func push(_ n: Int){
        queue.append(n)
    }
    
    for operation in operations{
        let o = operation.split(separator: " ")
        if o[0] == "I"{
            push(Int(o[1])!)
        }else if o[1] == "1", !queue.isEmpty{
            queue.sort(by: <)
            queue.removeLast()
        }else if o[1] == "-1", !queue.isEmpty{
            queue.sort(by: >)
            queue.removeLast()
        }
    }
    return queue.isEmpty ?  [0,0] : [queue.max()!, queue.min()!]
}

print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))
