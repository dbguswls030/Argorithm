//
//  main.swift
//  11047
//
//  Created by 유현진 on 2022/04/03.
//

import Foundation

func solution(){
    var input = readLine()!.components(separatedBy: " ").map(){Int(String($0))!}
    let N = input[0]
    var K = input[1]
    input = []
    var count = 0
    for _ in 0..<N{
        input.append(Int(readLine()!)!)
    }
    
    for i in stride(from: N-1, through: 0, by: -1){
        count += K / input[i]
        K = K % input[i]
        if K == 0 {
            break
        }
    }
    print(count)
}

solution()


