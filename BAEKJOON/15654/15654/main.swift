//
//  main.swift
//  15654
//
//  Created by 유현진 on 2022/04/20.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let _ = input[0]
    let M = input[1]
    input = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: <)
    var s = [Int]()
    sol(dept: 0)
    func sol(dept: Int){
        if dept == M{
            for i in s{
                print(i, terminator: " ")
            }
            print()
            return
        }
        for i in input{
            if !s.contains(i){
                s.append(i)
                sol(dept: dept+1)
                s.removeLast()
            }
        }
        
    }
}
solution()
