//
//  main.swift
//  암호 만들기
//
//  Created by 유현진 on 2023/04/21.
//

import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let L = input[0]
    let C = input[1]
    let f = ["a","e","i","o","u"]
    var result = ""
    let arr = readLine()!.split(separator: " ").map{String($0)}.sorted{$0 < $1}
    func dfs(n: Int){
        if result.count == L {
            var a = 0
            var b = 0
            for i in result{
                if f.contains(String(i)){
                    a += 1
                }else{
                    b += 1
                }
            }
            
            if a > 0, b > 1{
                print(result)
            }
            return
        }
        for i in n..<C{
            result += arr[i]
            dfs(n: i+1)
            result.removeLast()
        }
    }
    dfs(n: 0)
}

solution()
//["a", "c", "i", "s", "t", "w"]
