//
//  main.swift
//  1083
//
//  Created by 유현진 on 11/17/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var s = Int(readLine()!)!
    
    var start = 0
    while s > 0, start < N {
        var maxIndex = start
        for i in start...min(N-1, start+s){
            if arr[maxIndex] < arr[i] { maxIndex = i }
        }
        
        for i in (start..<maxIndex).reversed(){
            arr.swapAt(i+1, i)
            s -= 1
        }
        start += 1
    }
    
    print(arr.map{String($0)}.joined(separator: " "))
}
solution()
