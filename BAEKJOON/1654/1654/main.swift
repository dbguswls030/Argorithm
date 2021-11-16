//
//  main.swift
//  1654
//
//  Created by 유현진 on 2021/11/16.
//

import Foundation

func solution(){
    var input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    let K = input[0]
    let N = input[1]
    input = []
    for _ in 0..<K{
        input.append(Int(readLine()!)!)
    }
    let m = input.max()!
    var result = 0
    binarySearch(0, m)
    print(result)
    func binarySearch(_ low: Int, _ high: Int){ // 랜선 자른 거 >= N 이면 num 출력
        if low > high{
            return
        }
        var lanCount = 0
        let lanLength = (high+1 + low) / 2
        for i in 0..<K{
            lanCount += input[i] / lanLength
        }
        
        if lanCount >= N {
            result = lanLength
            binarySearch(lanLength+1 , high)
            
        }else{
            binarySearch(low, lanLength-1)
        }
    }
    
    
}
solution()
