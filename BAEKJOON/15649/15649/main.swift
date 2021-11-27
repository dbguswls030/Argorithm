//
//  main.swift
//  15649
//
//  Created by 유현진 on 2021/11/27.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map(){Int($0)!}
    let N = input[0]
    let M = input[1]
    bt([Int]())
    func bt(_ arr: [Int]){
        if arr.count == M{
            for i in arr{
                print(i, terminator: " ")
            }
            print("")
        }else{
            for i in 1...N{
                if !arr.contains(i){
                    bt(arr + [i])
                }
            }
        }
    }
}
solution()
