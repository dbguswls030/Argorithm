//
//  main.swift
//  18870
//
//  Created by 유현진 on 2022/04/06.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    
    let point = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = [Int: Int]()
    var rank = 0
    for i in point.sorted(by: <){
        if result[i] == nil{
            result[i] = rank
            rank += 1
        }
    }
    print("\(point.map{ String(result[$0]!)  }.joined(separator: " "))")
}
solution()
