//
//  main.swift
//  15651
//
//  Created by 유현진 on 2021/11/29.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    let N = input[0]
    let M = input[1]
    var list = [Int]()
    var result = ""
    bt(0)
    func bt(_ depth: Int){
        guard depth != M else{
            result += list.map{String($0)}.joined(separator: " ")
            result += "\n"
            return
        }
        for i in 1...N{
            list.append(i)
            bt(depth+1)
            list.removeLast()
        }
        
    }
    print(result)
}

solution()
