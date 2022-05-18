//
//  main.swift
//  Winter Coding(2019) 멀쩡한 사각형
//
//  Created by 유현진 on 2022/05/18.
//

import Foundation

// 각각의 최소 공배수 구하기
//비율로 변위 구하기

print(solution(8000000,12000000))

func gcd(up: Int, down: Int) -> Int{
    var up = up
    var down = down
    while down != 0{
        let r = up % down
        up = down
        down = r
    }
    return up
}
func solution(_ w:Int, _ h:Int) -> Int64{
    return Int64((w*h)-(w+h-gcd(up: max(w,h), down: min(w, h))))
}



//func solution(_ w:Int, _ h:Int) -> Int64{
//    if w == h {
//        return Int64(w)
//    }
//    let gcdNum = gcd(up: max(w,h), down: min(w, h))
//
//    let maxNum = w > h ? w / gcdNum : h / gcdNum
//    let minNum = w > h ? h / gcdNum : w / gcdNum
//
//    var count = maxNum / minNum
//    let r = maxNum % minNum
//    if r > 0{
//        count += 1
//    }
//
//    return Int64((w*h)-(w*count))
//}
