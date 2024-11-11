//
//  main.swift
//  13417
//
//  Created by 유현진 on 11/11/24.
//

import Foundation

func solution(){
    let T = Int(readLine()!)!
    for _ in 0..<T{
        var result = ""
        let _ = readLine()!
        for c in readLine()!.split(separator: " ").map({String($0)}){
            if result.isEmpty{
                result = c
            }else{
                if result.first!.asciiValue! >= Character(c).asciiValue!{
                    result = c+result
                }else{
                    result = result + c
                }
            }
        }
        print(result)
    }
}
solution()
