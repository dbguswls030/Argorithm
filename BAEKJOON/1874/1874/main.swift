//
//  main.swift
//  1874
//
//  Created by 유현진 on 2022/03/23.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!

    var stack = [Int]()
    var count = 1
    
    var result = [String]()
    for _ in 0..<n{
        let num = Int(readLine()!)!
        
        while count <= num{
            result.append("+")
            stack.append(count)
            count += 1
        }
        if stack.last == num{
            stack.popLast()
            result.append("-")
        }else{
            print("NO")
            return
        }
    }
    print(result.joined(separator: "\n"))
}
    
      

solution()
