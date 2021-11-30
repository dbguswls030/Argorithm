//
//  main.swift
//  15652
//
//  Created by 유현진 on 2021/11/30.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let N = input[0]
    let M = input[1]
    var list = [Int]()
    var result = ""
    bt(0)
    func bt(_ dept: Int){
        guard dept != M else{
            result += list.map{String($0)}.joined(separator: " ")
            result += "\n"
            return
        }
        for i in (list.last ?? 1)...N{
            list.append(i)
            bt(dept+1)
            list.removeLast()
        }
    }
    print(result)
}
solution()
