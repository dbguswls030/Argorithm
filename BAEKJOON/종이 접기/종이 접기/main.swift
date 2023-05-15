//
//  main.swift
//  종이 접기
//
//  Created by 유현진 on 2023/05/15.
//

import Foundation

func solution(){
    let N = Int(readLine()!)!
    for _ in 0..<N{
        let arr = readLine()!.map{String($0)}
        if result(arr: arr){
            print("YES")
        }else{
            print("NO")
        }
    }
}
func result(arr: [String]) -> Bool{
    if arr.count == 1{
        return true
    }
    var list = arr
    while list.count != 1{
        if list.removeFirst() == list.removeLast(){
            return false
        }
    }
    return result(arr: Array(arr[0..<arr.count/2]))
}
solution()
