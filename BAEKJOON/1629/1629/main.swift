//
//  main.swift
//  1629
//
//  Created by 유현진 on 2022/03/29.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map() {Int(String($0))!}
    let a = input[0]
    let b = input[1]
    let c = input[2]
    print(dc(a: a, b: b))
    
    func dc(a: Int, b:Int) -> Int{
        if b == 1 {
            return a % c
        }
        let temp = dc(a: a, b: b/2)
        
        if b % 2 == 1{
            return (temp*temp%c) * a%c
        }
        return temp*temp%c
    }
}

solution()
