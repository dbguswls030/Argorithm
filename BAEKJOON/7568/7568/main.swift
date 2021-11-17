//
//  main.swift
//  7568
//
//  Created by 유현진 on 2021/11/17.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var arr = [[Int]]()
    for i in 0..<N{
        arr.append([Int]())
        arr[i].append(contentsOf: readLine()!.components(separatedBy: " ").map() {Int($0)!})
        arr[i].append(1)
    }
    for i in 0..<N{
        for j in 0..<N{
            if arr[i][0] < arr[j][0] && arr[i][1] < arr[j][1]{
                arr[i][2] += 1
            }
        }
    }
    for i in 0..<N{
        print(arr[i][2], terminator: " ")
    }
}

solution()
