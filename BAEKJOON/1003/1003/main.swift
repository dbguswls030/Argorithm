//
//  main.swift
//  1003
//
//  Created by 유현진 on 2022/01/24.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    var dp = [0,1,1]
    for i in 2..<41{
        dp.append(dp[i] + dp[i-1])
    }
    for _ in 0..<T{
        let num = Int(readLine()!)!
        fib(num: num)
    }
    
    func fib(num: Int){
        if num == 0{
            print("1 0")
        }else if num == 1{
            print("0 1")
        }else{
            print("\(dp[num-1]) \(dp[num])")
            
        }
    }
    
}
solution()
