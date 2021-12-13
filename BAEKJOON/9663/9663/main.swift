//
//  main.swift
//  9663
//
//  Created by 유현진 on 2021/12/02.
//

import Foundation
solution()
func solution(){
    let N = Int(readLine()!)!
    var q = [Int]()
    var result = 0
    dfs(1)
    print(result)
    func dfs(_ depth: Int){
        for i in 0..<N{
            if !q.contains(i) && promising(i){
                q.append(i)
                if depth == N{
                    result += 1
                }else{
                  dfs(depth+1)
                }
                q.removeLast()
            }
        }
    }
    func promising(_ val: Int) -> Bool{
        for i in 0..<q.count{
            if (q[i] - val).magnitude == (i - q.count).magnitude{
                return false
            }
        }
        return true
    }
}
