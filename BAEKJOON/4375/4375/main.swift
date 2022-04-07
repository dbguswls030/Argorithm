//
//  main.swift
//  4375
//
//  Created by 유현진 on 2022/04/07.
//

import Foundation

func solution(){
    
    while let N = readLine(){
        
        var count = 1
        var result = 1
        while true{
            if result % Int(N)! == 0{
                break
            }else{
                result = result * 10 + 1
                result %= Int(N)!
                count += 1
            }
        }
        print(count)
    }
}
solution()
