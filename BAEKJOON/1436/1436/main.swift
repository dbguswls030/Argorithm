//
//  main.swift
//  1436
//
//  Created by 유현진 on 2021/11/22.
//

import Foundation

//func solution(){
//    let N = Int(readLine()!)!
//    var count = 0
//    var num = 666
//    while true{
//
//        if String(num).contains("666"){
//            count += 1
//            if count == N{
//                break
//            }
//        }
//        num += 1
//    }
//    print(num)
//}
//solution()

func solution(){
    let N = Int(readLine()!)!
    var count = 0
    var num = 666
    while true{
        var count6 = 0
        var tmp = num
        
        while tmp > 0 {
            if tmp % 10 == 6{
                count6 += 1
            }else{
                count6 = 0
            }
            if count6 == 3{
                count += 1
                break
            }
            tmp/=10
        }
        if count == N {
            break
        }
        num += 1
    }
    print(num)
}
solution()
