//
//  main.swift
//  1461
//
//  Created by 유현진 on 1/4/25.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]
    let M = input[1]
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    var result = 0
    let pNum = arr.filter{$0>0}
    let nNum = arr.filter{$0<0}
    
    var pPair = [[Int]]()
    var nPair = [[Int]]()
    
    var count = 0
    for i in (0..<pNum.count).reversed(){
        if count % M == 0{
            pPair.append([pNum[i]])
        }else{
            pPair[count / M].append(pNum[i])
        }
        count += 1
    }
    count = 0
    for i in 0..<nNum.count{
        if count % M == 0{
            nPair.append([nNum[i]])
        }else{
            nPair[count / M].append(nNum[i])
        }
        count += 1
    }
    let p = pPair.first?[0] ?? 0
    let n = nPair.first?[0] ?? 0
  
    if abs(p) > abs(n){
        for n in nPair{
            result += abs(n[0]) * 2
        }
        for p in pPair[1..<pPair.count]{
            result += abs(p[0]) * 2
        }
        result += abs(pPair[0][0])
    }else{
        for p in pPair{
            result += abs(p[0]) * 2
        }
        for n in nPair[1..<nPair.count]{
            result += abs(n[0]) * 2
        }
        result += abs(nPair[0][0])
    }
    
    print(result)
}
solution()
