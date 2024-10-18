//
//  main.swift
//  1806
//
//  Created by 유현진 on 10/18/24.
//

import Foundation

//func solution(){
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let N = input[0]
//    let S = input[1]
//    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
//    var result = Int.max
//    
//    for i in 0..<N{
//        dfs(dept: 1, index: i, sum: arr[i])
//    }
//    
//    func dfs(dept: Int, index: Int, sum: Int){
//        if sum >= S{
//            result = min(result, dept)
//            return
//        }
//        
//        for i in index+1..<N{
//            dfs(dept: dept+1, index: i, sum: sum+arr[i])
//        }
//    }
//}
//func solution(){
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let N = input[0]
//    let S = input[1]
//    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
//    var pSum = [Int]()
//    var result = Int.max
//    
//    for i in 0..<N{
//        var sum = 0
//        for j in i..<N{
//            sum += arr[j]
//            if sum >= S{
//                result = min(result, j-i+1)
//                break
//            }
//        }
//    }
//    if result == Int.max{
//        print(0)
//    }else{
//        print(result)
//    }
//}
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let S = input[1]
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result = Int.max
    
    var start = 0
    var end = 0
    var sum = arr[0]
    
    while start<=end, end < N{
        if sum >= S{
            result = min(end-start+1, result)
            sum -= arr[start]
            start += 1
        }else{
            sum += arr[end]
            if end >= N{ break }
            end += 1
        }
    }
    if result == Int.max{
        print(0)
    }else{
        print(result)
    }
}
solution()
