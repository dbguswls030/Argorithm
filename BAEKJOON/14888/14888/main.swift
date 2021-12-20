//
//  main.swift
//  14888
//
//  Created by 유현진 on 2021/12/20.
//

import Foundation
solution()




func solution(){
    
    let N = Int(readLine()!)!
    var A = [Int]() // 수열
    var O = [Int]() // + - * / 갯수
    A.append(contentsOf: readLine()!.components(separatedBy: " ").map() {Int($0)!})
    O.append(contentsOf: readLine()!.components(separatedBy: " ").map() {Int($0)!})
    var max = -1000000000
    var min = 1000000000
    bt(1, A.first!)
    print(max)
    print(min)
    
    
    func bt(_ depth: Int, _ result: Int){
        if depth == N{
            if max < result{
                max = result
            }
            if min > result{
                min = result
            }
            return
        }
        if O[0] != 0 {
            O[0] -= 1
            bt(depth+1, add(depth, result))
            O[0] += 1
        }
        if O[1] != 0{
            O[1] -= 1
            bt(depth+1, minus(depth, result))
            O[1] += 1
        }
        if O[2] != 0{
            O[2] -= 1
            bt(depth+1, mul(depth, result))
            O[2] += 1
        }
        if O[3] != 0{
            O[3] -= 1
            bt(depth+1, div(depth, result))
            O[3] += 1
        }
    }
    
    
    
    
    
    
    func add(_ depth: Int, _ result: Int) -> Int{
        return result + A[depth]
    }
    func minus(_ depth: Int, _ result: Int) -> Int{
        return result - A[depth]
    }
    func mul(_ depth: Int, _ result: Int) -> Int{
        return result * A[depth]
    }
    func div(_ depth: Int, _ result: Int) -> Int{
        return result / A[depth]
    }
}
