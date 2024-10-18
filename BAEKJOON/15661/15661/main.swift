//
//  main.swift
//  15661
//
//  Created by 유현진 on 10/18/24.
//

import Foundation

//func solution(){
//    let N = Int(readLine()!)!
//    var S = [[Int]]()
//    var temp = [[Bool]]()
//    var result = Int.max
//    for _ in 0..<N{
//        S.append(readLine()!.split(separator: " ").map{Int(String($0))!})
//    }
//
//    dfs(index: 1, arr: [0])
//    
//    for i in 0..<temp.count{
//        var a = 0
//        var aTeam = [Int]()
//        var b = 0
//        var bTeam = [Int]()
//        for (offset, boolValue) in temp[i].enumerated(){
//            if boolValue{
//                aTeam.append(offset)
//            }else{
//                bTeam.append(offset)
//            }
//        }
//        
//        for i in aTeam{
//            for j in aTeam{
//                a += S[i][j]
//            }
//        }
//        for i in bTeam{
//            for j in bTeam{
//                b += S[i][j]
//            }
//        }
////        print(aTeam, bTeam, abs(a-b))
//        result = min(result, abs(a-b))
//    }
//
//    print(result)
//    func dfs(index: Int, arr: [Int]){
//        if arr.count < N{
//            var bools = Array(repeating: false, count: N)
//            for i in arr{
//                bools[i] = true
//            }
//            temp.append(bools)
//        }
//        var arr = arr
//        for i in index..<N{
//            if arr.count < N{
//                arr.append(i)
//                dfs(index: i+1, arr: arr)
//                arr.removeLast()
//            }
//        }
//    }
//}

func solution(){
    let N = Int(readLine()!)!
    var S = [[Int]]()
    var visited = Array(repeating: false, count: N)
    var result = Int.max
    for _ in 0..<N{
        S.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    visited[0] = true
    dfs(index: 1, arr: [0])

    print(result)
    func dfs(index: Int, arr: [Int]){
        if arr.count < N{
            var start = 0
            var link = 0
            for i in 0..<N{
                for j in 0..<N{
                    if !visited[i], !visited[j] {
                        start += S[i][j]
                    }
                    if visited[i], visited[j] {
                        link += S[i][j]
                    }
                }
            }
            result = min(result, abs(start-link))
        }
        
        var arr = arr
        for i in index..<N{
            if arr.count < N{
                visited[i] = true
                arr.append(i)
                dfs(index: i+1, arr: arr)
                arr.removeLast()
                visited[i] = false
            }
        }
    }
}
solution()
