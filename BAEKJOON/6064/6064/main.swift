//
//  main.swift
//  6064
//
//  Created by 유현진 on 2022/04/17.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    for _ in 0..<T{
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let M = input[0]
        let N = input[1]
        var x = input[2]
        let y = input[3]
        let maxYear = LCM(a: M, b: N)
        
        while true{
            if x > maxYear || (x-y) % N == 0{
                break
            }
            x += M
        }
        x > maxYear ? print(-1) : print (x)
    }
    func GCD(a: Int, b: Int) -> Int {
        if a%b == 0{
            return b
        }else{
            return GCD(a: b, b: a%b)
        }
    }
    func LCM(a: Int, b: Int) -> Int{
        return a * b / GCD(a: a, b: b)
    }
}
solution()
