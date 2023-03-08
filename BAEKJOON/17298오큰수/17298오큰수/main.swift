//
//  main.swift
//  17298오큰수
//
//  Created by 유현진 on 2023/03/08.
//

    import Foundation

    func solution(){
        let N = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        var s = [Int]()
        var result = Array(repeating: -1, count: N)
        for (index, number) in arr.enumerated() {
            while !s.isEmpty, arr[s[s.count-1]] < number{
                result[s.removeLast()] = number
            }
            s.append(index)
            
        }
        print(result.map{String($0)}.joined(separator: " "))
    }
    solution()
