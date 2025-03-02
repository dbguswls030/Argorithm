//
//  main.swift
//  2437
//
//  Created by 유현진 on 3/2/25.
//

import Foundation

//func solution(){
//    let N = Int(readLine()!)!
//    let weights = readLine()!.split(separator: " ").map{Int(String($0))!}
//    var combi = Set<Int>()
//    
//    func combination(index: Int, sum: Int){
//        combi.insert(sum)
//        for i in index+1..<N{
//            combination(index: i, sum: sum+weights[i])
//        }
//    }
//    
//    for i in 0..<N{
//        combination(index: i, sum: weights[i])
//    }
//    
//    for i in 1...10000000000{
//        if !combi.contains(i){
//            print(i)
//            return
//        }
//    }
//}
func solution(){
    let _ = Int(readLine()!)!
    let weights = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    var sum = 1
    for weight in weights{
        if sum < weight{
            break
        }
        sum += weight
    }
    print(sum)
    
}
solution()

