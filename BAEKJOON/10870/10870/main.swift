//
//  main.swift
//  10870
//
//  Created by 유현진 on 2021/11/16.
//

import Foundation

func solution(){
    
    let N = Int(readLine()!)!
    
    print(fib(N))
    func fib(_ num: Int) -> Int{
        if num == 0{
            return 0
        }else if num == 1{
            return 1
        }else{
            return fib(num-2)+fib(num-1)
        }
    }
}
solution()
