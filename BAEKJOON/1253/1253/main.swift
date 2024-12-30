//
//  main.swift
//  1253
//
//  Created by 유현진 on 12/30/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    if N < 3 {
        print(0)
        return
    }
    var result = 0
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    
    func search(numIndex: Int){
        let num = arr[numIndex]
        
        var left = 0
        var right = N-1
        
        while left<right{
            if left == numIndex{
                left += 1
                continue
            }
            if right == numIndex{
                right -= 1
                continue
            }
            if arr[left] + arr[right] == num{
                result += 1
                return
            }else if arr[left] + arr[right] > num{
                right -= 1
            }else{
                left += 1
            }
            
        }
    }
    
    for i in 0..<N{
        search(numIndex: i)
    }
    print(result)
}
solution()
