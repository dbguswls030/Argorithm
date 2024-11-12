//
//  main.swift
//  2847
//
//  Created by 유현진 on 11/12/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var list = [Int]()
    var count = 0
    for _ in 0..<N{
        list.append(Int(readLine()!)!)
    }
    
    for i in (0..<N-1).reversed(){
        if list[i] >= list[i+1]{
            count += (list[i] - (list[i+1] - 1))
            list[i] = list[i+1] - 1
        }
    }
    print(count)
}
solution()
