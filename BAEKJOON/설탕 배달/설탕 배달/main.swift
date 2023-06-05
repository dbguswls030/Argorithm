//
//  main.swift
//  설탕 배달
//
//  Created by 유현진 on 2023/06/02.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 5001)
    dp[1] = -1
    dp[2] = -1
    dp[3] = 1
    dp[4] = -1
    dp[5] = 1
    if n < 6{
        print(dp[n])
        return
    }
    
    
    for index in 5...n{
        let m5 = index - 5
        let m3 = index - 3
        
        if dp[m5] == -1{
            if dp[m3] == -1{
                dp[index] = -1
            }else{
                dp[index] = dp[m3] + 1
            }
        }else{
            dp[index] = dp[m5] + 1
        }
    }
    print(dp[n])
}
solution()
