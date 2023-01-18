//
//  main.swift
//  숫자카드2
//
//  Created by 유현진 on 2023/01/18.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    var cards = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    let M = Int(readLine()!)!
    let numbers = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    let card = cards.sorted(by: <)
    var result = [Int]()
    
}

solution()
