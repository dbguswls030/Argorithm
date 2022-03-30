//
//  main.swift
//  9372
//
//  Created by 유현진 on 2022/03/30.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    
    for _ in 0..<T{
        var input = readLine()!.components(separatedBy: " ").map(){Int(String($0))!}
        let N = input[0]
        let M = input[1]
        
        for _ in 0..<M{
            input = readLine()!.components(separatedBy: " ").map() {Int(String($0))!}
            let a = input[0]
            let b = input[1]
         
        }
        print(N-1)
    }
}
solution()
