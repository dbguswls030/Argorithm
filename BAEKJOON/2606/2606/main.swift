//
//  main.swift
//  2606
//
//  Created by 유현진 on 2021/05/13.
//
import Foundation

var count: Int = Int(readLine()!)!
//var arr = Array(repeating:  Array(repeating: 0, count: count), count: count)
var arr: [[Int]] = Array(repeating: [], count: count+1)
var vArr = [Int]()

func inputNode(){
    let e : Int = Int(readLine()!)!
    for _ in 0..<e{

        let a = readLine()!.components(separatedBy: " ")
        let i = Int(a[0])!
        let j = Int(a[1])!
        arr[i].append(j)
        arr[j].append(i)
    }
}

func dfs(_ n: Int){
    if !vArr.contains(n){
        vArr.append(n)
        for i in arr[n]{
            dfs(i)
        }
    }
}

inputNode()
dfs(1)
print(vArr.count-1)
