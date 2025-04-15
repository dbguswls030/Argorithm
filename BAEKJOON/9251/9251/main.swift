//
//  main.swift
//  9251
//
//  Created by 유현진 on 4/15/25.
//

import Foundation

func solution(){
    var arr = [[String]]()

    for _ in 0..<2{
        arr.append(readLine()!.map { String($0) })
    }

    let leftArray = [""] + (arr[0].count >= arr[1].count ? arr[0] : arr[1])
    let rightArray = [""] + (arr[0].count < arr[1].count ? arr[0] : arr[1])

    var dp = Array(repeating: Array(repeating: 0, count: rightArray.count+1), count: leftArray.count+1)

    for l in 1..<leftArray.count{
        for r in 1..<rightArray.count{
            if leftArray[l] == rightArray[r]{
                dp[l][r] = dp[l-1][r-1] + 1
            }else{
                dp[l][r] = max(dp[l-1][r], dp[l][r-1])
            }
        }
    }
    print(dp[leftArray.count-1][rightArray.count-1])
}

solution()
