//
//  main.swift
//  9184
//
//  Created by 유현진 on 2022/01/25.
//

import Foundation

func solution(){
    var map = Array(repeating: Array(repeating: Array(repeating: 0, count: 21), count: 21), count: 21)
    while(true){
        let input = readLine()!.components(separatedBy: " ").map() {Int(String($0))!}
        let a = input[0]
        let b = input[1]
        let c = input[2]
        if a == -1, b == -1, c == -1 {
            break
        }
        print("w(\(a), \(b), \(c)) = \(w(a: a, b: b, c: c))")
    }
    func w(a: Int, b: Int, c: Int) -> Int{
        
        if a<=0 || b<=0 || c<=0{
            return 1
        }else if a<21 && b<21 && c<21 && map[a][b][c] != 0{
            return map[a][b][c]
        }else if a>20 || b>20 || c>20{
            return w(a: 20, b: 20, c: 20)
            
        }else if a<b && b<c {
            if map[a][b][c] == 0{
                map[a][b][c] = w(a: a, b: b, c: c-1) + w(a: a, b: b-1, c: c-1) - w(a: a, b: b-1, c: c)
            }
            return map[a][b][c]
        }else{
            if map[a][b][c] == 0{
                map[a][b][c] = w(a: a-1, b: b, c: c) + w(a: a-1, b: b-1, c: c) + w(a: a-1, b: b, c: c-1) - w(a: a-1, b: b-1, c: c-1)
            }
            return map[a][b][c]
        }
    }
}
solution()
