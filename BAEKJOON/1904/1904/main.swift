//
//  main.swift
//  1904
//
//  Created by 유현진 on 2022/03/07.
//

import Foundation

func solution(){
    fib()
    func fib(){
        let N = Int(readLine()!)!
        var m = [Int]()
        
        m.append(0)
        m.append(1)
        m.append(2)
        for i in 0...N{
            if(i > 2){
                m.append(((m[i-1] + m[i-2])%15746))
            }
            
        }
        print(m[N])
    }
}
solution()
