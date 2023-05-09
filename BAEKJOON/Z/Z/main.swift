//
//  main.swift
//  Z
//
//  Created by 유현진 on 2023/05/08.
//

import Foundation

//func solution() -> Int{
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let N = input[0]
//    let r = input[1] + 1
//    let c = input[2] + 1
//    let len = Int(pow(2.0, Float(N)))
//    print(len)
//    var count = 0
//    func dc(size: Int, a: Int, b: Int){
//        let row = size / 2
//        let col = size / 2
//        let x = a > row ? 1 : 0
//        let y = b > col ? 1 : 0
//
//        if x == 1 {
//            count += row * size
//        }
//        if y == 1{
//            count += col * row
//        }
//
//        if size > 4{
//            print(count)
//            dc(size: size/2, a: a - Int(pow(2.0, Float(size))), b: b - Int(pow(2.0, Float(size))))
//        }else{
//            print("zz",count)
//            let aa = a/2
//            let bb = b/2
//            if aa == 1, bb == 1{
//                count += 1
//            }else if aa == 1,bb == 2 {
//                count += 2
//            }else if aa == 2, bb == 1{
//                count += 3
//            }else if aa == 2, bb == 2{
//                count += 4
//            }
//            print(aa, bb)
//        }
//    }
//
//    dc(size: len, a: r, b: c)
//
//
//    return count
//
//}


func solution() -> Int{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var N = input[0]
    var r = input[1]
    var c = input[2]
    var count = 0
    while N != 0 {
        N -= 1
        let half = Int(pow(2.0, Float(N)))
        // 우상단
        if r < half, c >= half{
            count += half * half * 1
            c -= half
        }else if r < half, c < half{ // 좌상단
            count += half * half * 0
        }else if r >= half, c < half{ // 좌하단
            count += half * half * 2
            r -= half
        }else{ // 우하단
            count += half * half * 3
            c -= half
            r -= half
        }
    }
    return count
    
}

print(solution())
