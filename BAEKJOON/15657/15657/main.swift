//
//  main.swift
//  15657
//
//  Created by 유현진 on 2022/04/20.
//

import Foundation

func solution(){
    var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let N = input[0]
    let M = input[1]
    input = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: <)
    var s = [String]()
    var result = ""
    sol(arrN: input, dept: 0)
    print(result)
    func sol(arrN: [Int], dept: Int){
        var arrN = arrN
        if s.count == M {
            result += s.joined(separator: " ")
            result += "\n"
        }else{
            while arrN.count > 0{
                s.append(String(arrN.first!))
                sol(arrN: arrN, dept: dept+1)
                s.removeLast()
                arrN.removeFirst()
            }
            
        }
    }
}
solution()
