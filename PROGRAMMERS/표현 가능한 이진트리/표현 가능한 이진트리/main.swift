//
//  main.swift
//  표현 가능한 이진트리
//
//  Created by 유현진 on 3/31/25.
//

import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    var result = [Int]()
    
    for number in numbers {
        if number == 0{
            result.append(0)
            continue
        }
        let binary = convertToBinary(num: number) // 이진수 변환
        let fullBin = makeFullBinaryArray(bin: binary) // 포화 이진트리로 변환

        if isExistZeroTree(binary: fullBin){
            result.append(1)
        }else{
            result.append(0)
        }
    }
    return result
}

func convertToBinary(num: Int64) -> [String]{
    return String(num, radix: 2).map{String($0)}
}

func makeFullBinaryArray(bin: [String]) -> [String]{
    var h = 1.0 // 트리의 높이
    while bin.count > Int(pow(2.0, h))-1{
        h+=1
    }
    let maxNode = Int(pow(2.0, h))-1
    return Array(repeating: "0", count: maxNode - bin.count) + bin
}

func isExistZeroTree(binary: [String]) -> Bool{
    if binary.count < 3 { return true }
    let mid = (binary.count - 1) / 2
    let left = mid / 2
    let right = (mid+1+(binary.count - 1))/2

    if binary[mid] == "0"{
        if binary[left] == "1" { return false }
        if binary[right] == "1" { return false }
    }
    
    return isExistZeroTree(binary: Array(binary[0..<mid])) && isExistZeroTree(binary: Array(binary[mid+1..<binary.count]))
}

//print(solution([95]))
//print(solution([42]))
print(solution([7, 42, 5]))
print(solution([63, 111, 95]))
//print(solution([12]))
