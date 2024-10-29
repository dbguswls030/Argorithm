//
//  main.swift
//  11561
//
//  Created by 유현진 on 10/29/24.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    
    for _ in 0..<T{
        let N = Int(readLine()!)!
        var start = 1
        var end = 1000000000
        var result = 0
        while start<=end{
            let mid = (start+end)/2
            let sum = (mid*(mid+1)) / 2
            
            if sum<=N{
                start = mid + 1
                result = mid
            }else{
                end = mid - 1
            }
        }
        print(result)
    }
}
solution()
