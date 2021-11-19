//
//  main.swift
//  1018
//
//  Created by 유현진 on 2021/11/18.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    var arr = [[String]]()
    let N = input[0]
    let M = input[1]
    for _ in 0..<N{
        arr.append(readLine()!.map({String($0)}))
    }
    var count = [Int]()
    for i in 0..<N-7{
        for j in 0..<M-7{
            var odd = 0
            var even = 0
            for p in i..<i+8{
                for q in j..<j+8{
                    if (p+q) % 2 == 0 {
                        if arr[p][q] != "W" { odd += 1}
                        if arr[p][q] != "B" { even += 1}
                    }else{
                        if arr[p][q] != "B" { odd += 1}
                        if arr[p][q] != "W" { even += 1}
                    }
                }
                
            }
            count.append(odd)
            count.append(even)
        }
    }
    print(count.min()!)
}

solution()
