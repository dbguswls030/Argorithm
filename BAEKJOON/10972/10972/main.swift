//
//  main.swift
//  10972
//
//  Created by 유현진 on 10/15/24.
//

import Foundation

let N = Int(readLine()!)!
var s = readLine()!.split(separator: " ").map{Int(String($0))!}


func solution(){
    
    var maxValue = 0
    var maxIndex = -1
    if Array(1...N).reversed() == s {
        print("-1")
        return
    }
    var index = -1
    
    for i in (0..<N).reversed(){
        if i-1 >= 0, s[i] > s[i-1]{
            index = i - 1
            break
        }
    }
    
    for i in (index+1..<N).reversed(){
        if s[index] < s[i]{
            s.swapAt(index, i)
            break
        }
    }
    
    let result = s[0...index]+s[index+1..<N].sorted()
    print(result.map{String($0)}.joined(separator: " "))
}
solution()
