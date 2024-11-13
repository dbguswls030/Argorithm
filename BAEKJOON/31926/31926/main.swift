//
//  main.swift
//  31926
//
//  Created by 유현진 on 11/13/24.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    if N == 1{
        print(10)
    }else{
        for i in 1...100000000{
            if N == Int(pow(2.0, Float(i))){
                print(8 + i + 2)
                break
            }else if N < Int(pow(2.0, Float(i))){
                print(8 + i + 1)
                break
            }
        }
    }
}
solution()
//func solution(){
//    let N = Int(readLine()!)!
//    if N == 1{
//        print(10)
//    }else{
//        for i in 1...100000000{
//            if N <= Int(pow(2.0, Float(i))){
//                if N % 2 == 0 {
//                    print(8 + i + 2)
//                }else{
//                    print(8 + i + 1)
//                }
//                break
//            }
//        }
//    }
//}
//solution()
//func solution(){
//    let N = Int(readLine()!)!
//    if N == 1{
//        print(10)
//    }else{
//        for i in 1...100000000{
//            if N - Int(pow(2.0, Float(i))) == 0{
//                print(8 + i + 2)
//                break
//            }else if N - Int(pow(2.0, Float(i))) < 0{
//                print(8 + i + 1)
//                break
//            }
//        }
//    }
//}
//solution()
