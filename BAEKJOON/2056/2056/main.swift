//
//  main.swift
//  2056
//
//  Created by 유현진 on 1/24/25.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var jobs = [[Int]]()
    var result = Array(repeating: 0, count: N)
    for _ in 0..<N{
        jobs.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    for (offset, job) in jobs.enumerated() {
        if job[1] == 0{
            result[offset] = max(result[offset], result[offset] + job[0])
        }else{
            for i in 2..<2+job[1]{
                result[offset] = max(result[offset], result[job[i]-1] + job[0])
            }
        }
        
    }
    print(result.max()!)
}

solution()
