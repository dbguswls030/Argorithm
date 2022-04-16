//
//  main.swift
//  1748
//
//  Created by 유현진 on 2022/04/16.
//

import Foundation

//func solution(){
//        let N = Int(readLine()!)!
//        var count = 0
//        var len = 1
//        var ind: Float = 1
//        for i in 1...N{
//            if i >= Int(pow(10.0, ind)){
//                ind += 1
//                len += 1
//            }
//            count += len
//        }
//        print(count)
//}
func solution(){
    var N = Int(readLine()!)!
    var result = 0
    
    var len = String(N).count
    var count = 9
    if len == 1{
        result = N
    }else{
        for i in 1...len{
            result += count * i
            N -= count
            count *= 10
        }
        result += N*len
    }  
    print(result)
}
solution()
