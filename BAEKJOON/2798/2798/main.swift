//
//  main.swift
//  2798
//
//  Created by 유현진 on 2021/11/17.
//

import Foundation
func solution(){
    var input = readLine()!.components(separatedBy: " ").map(){Int($0)!}
    //let N = input[0]
    let M = input[1]
    input = readLine()!.components(separatedBy: " ").map(){Int($0)!}
    var max = 0
    for i in 0..<input.count-2{
        for j in i+1..<input.count-1{
            for k in j+1..<input.count{
                let sum = input[i]+input[j]+input[k]
                if sum <= M && max < sum{
                    max = sum
                }
                
            }
        }
    }
    print(max)
    
}
solution()
