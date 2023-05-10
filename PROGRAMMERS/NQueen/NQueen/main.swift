//
//  main.swift
//  NQueen
//
//  Created by 유현진 on 2023/05/01.
//

import Foundation

//func solution(_ n:Int) -> Int {
//    var row = Array(repeating: 0, count: n)
//    var result = 0
//    func valid(i: Int) -> Bool{
//        for j in 0..<i{
//            if row[i] == row[j]{ return false }
//            if abs(i - j) == abs(row[i] - row[j]){
//                return false
//            }
//        }
//        print("gg")
//        return true
//    }
//    func dfs(dept: Int){
//        if dept == n {
//            result += 1
//            return
//        }
//        for i in 0..<n{
//            row[dept] = i
//            if valid(i: i){
//                dfs(dept: dept+1)
//            }
//        }
//    }
//
//    dfs(dept: 0)
//
//    return result
//}
func solution(_ n:Int) -> Int {
    var row = Array(repeating: -1, count: n)
    var result = 0
    func valid(i: Int) -> Bool{
        for j in 0..<i{
            if row[i] == row[j]{ return false }
            if abs(i - j) == abs(row[i] - row[j]){ return false }
        }
        return true
    }
    
    func dfs(dept: Int){
        if dept == n {
            result += 1
            return
        }
        for i in 0..<n{
            row[dept] = i
            if valid(i: dept){
                dfs(dept: dept+1)
            }
        }
    }
    dfs(dept: 0)
    
    return result
}
print(solution(4))
