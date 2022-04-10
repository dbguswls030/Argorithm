//
//  main.swift
//  1037
//
//  Created by 유현진 on 2022/04/10.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var A = readLine()!.split(separator: " ").map {Int(String($0))!}
    print(A.min()! * A.max()!)
    
}
solution()
