//
//  main.swift
//  15656
//
//  Created by 유현진 on 2022/04/20.
//

import Foundation

func solotion(){
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
    var s = [String]()
    var result = ""
    sol(dept: 0)
    print(result)
    func sol(dept: Int){
        if s.count == M {
            result += s.joined(separator: " ")
            result += "\n"
        }else{
            for i in 0..<N{
                s.append(String(input[i]))
                sol(dept: dept+1)
                s.removeLast()
            }
        }
    }
}
solotion()
