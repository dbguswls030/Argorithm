//
//  main.swift
//  10872
//
//  Created by 유현진 on 2021/11/16.
//

import Foundation

func solution(){
    
    let N = Int(readLine()!)!
    
    print(fac(N))
    
    func fac(_ num: Int) -> Int{
        if num <= 1{
            return 1
        }else{
            return num*fac(num-1)
        }
    }
    
}
solution()
