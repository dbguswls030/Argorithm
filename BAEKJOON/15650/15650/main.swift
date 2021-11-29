//
//  main.swift
//  15650
//
//  Created by 유현진 on 2021/11/29.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    let N = input[0]
    let M = input[1]
    var visited = Array(repeating: false, count: N)
    bt([Int](), 1)
    func bt(_ list: [Int], _ index: Int){
        if list.count == M {
            for i in list{
                print(i, terminator: " ")
            }
            print("")
        }else{
            for i in index...N{
                if visited[i-1] == false{
                    visited[i-1] = true
                    bt(list+[i], i)
                    visited[i-1] = false
                }
            }

        }
        
        
    }
}

solution()
