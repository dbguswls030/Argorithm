//
//  main.swift
//  14889
//
//  Created by 유현진 on 2021/12/21.
//

import Foundation
func solution(){
    let N = Int(readLine()!)!
    var check = Array(repeating: true, count: N)
    var S = [[Int]]()
    var result = 2147483647
  
    for _ in 0..<N{
        S.append(readLine()!.components(separatedBy: " ").map() {Int($0)!})
    }

    team(0, 0)
    print(result)
   
    func team(_ num: Int, _ count: Int) {
        if count == N/2{
            compare()
        }else{
            for i in num+1..<N{
                check[i] = false
                team(i, count+1)
                check[i] = true
            }
        }
    }
    
    func compare(){
        var startPower = 0
        var linkPower = 0
        var start = [Int]()
        var link = [Int]()
        for i in 0..<N{
            if check[i] == false{
                start.append(i)
            }
            else{
                link.append(i)
            }
        }
        
        for i in 0..<start.count{
            for j in i+1..<start.count{
                startPower += S[start[i]][start[j]] + S[start[j]][start[i]]
                linkPower += S[link[i]][link[j]] + S[link[j]][link[i]]
            }
        }

        let tmp = Int((startPower - linkPower).magnitude)
        if result > tmp{
            result = tmp
        }
    }
}

solution()
