//
//  main.swift
//  15655
//
//  Created by 유현진 on 2022/04/20.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let _ = input[0]
    let M = input[1]
    input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
    var s = [Int]()
    sol(arrN: input, dept: 0)
    
    
    func sol(arrN: [Int], dept: Int){
        var arrN = arrN
        if dept == M {
            for i in s{
                print(i,terminator: " ")
            }
            print()
            return
        }
        for _ in 0..<arrN.count{
            s.append(arrN.removeFirst())
            sol(arrN: arrN, dept: dept+1)
            s.removeLast()
        }
    }
}
solution()
