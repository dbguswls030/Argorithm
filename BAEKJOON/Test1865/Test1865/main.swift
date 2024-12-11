//
//  main.swift
//  Test1865
//
//  Created by 유현진 on 12/11/24.
//

import Foundation

func solution(){
    for _ in 0..<Int(readLine()!)!{
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let N = input[0]
        let M = input[1]
        let W = input[2]

        var edges = Array(repeating: [(Int, Int)](), count: N)
        var result = Array(repeating: Int.max/10, count: N)
        for _ in 0..<M{
            input = readLine()!.split(separator: " ").map{Int(String($0))!}
            edges[input[0]-1].append((input[1]-1, input[2]))
            edges[input[1]-1].append((input[0]-1, input[2]))
        }

        for _ in 0..<W{
            input = readLine()!.split(separator: " ").map{Int(String($0))!}
            edges[input[0]-1].append((input[1]-1, -input[2]))
        }

        var isCycle = false
        result[0] = 0
        for _ in 0..<N-1{
            for cur in 0..<edges.count{
                for edge in edges[cur]{
                    let next = edge.0
                    let cost = edge.1
                    if  result[next] > result[cur] + cost{
                        result[next] = result[cur] + cost
                    }
                }
            }
        }
        for cur in 0..<edges.count{
            for edge in edges[cur]{
                let next = edge.0
                let cost = edge.1
                if  result[next] > result[cur] + cost{
                    isCycle = true
                }
            }
        }

        print(isCycle ? "YES" : "NO")
    }
}

//func solution(){
//    for _ in 0..<Int(readLine()!)!{
//        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
//        let N = input[0]
//        let M = input[1]
//        let W = input[2]
//        
//        var edges = Array(repeating: [(Int, Int)](), count: N)
//        
//        for _ in 0..<M{
//            input = readLine()!.split(separator: " ").map{Int(String($0))!}
//            edges[input[0]-1].append((input[1]-1, input[2]))
//            edges[input[1]-1].append((input[0]-1, input[2]))
//        }
//        
//        for _ in 0..<W{
//            input = readLine()!.split(separator: " ").map{Int(String($0))!}
//            edges[input[0]-1].append((input[1]-1, -input[2]))
//        }
//        
//        var isCycle = false
//        for start in 0..<N{
//            var result = Array(repeating: Int.max, count: N)
//            result[start] = 0
//            
//            for i in 0..<N-1{
//                for cur in 0..<edges.count{
//                    for edge in edges[cur]{
//                        let next = edge.0
//                        let cost = edge.1
//                        if result[cur] != Int.max && result[next] > result[cur] + cost{
//                            result[next] = result[cur] + cost
//                            
//                        }
//                    }
//                }
//            }
//            
//            for cur in 0..<edges.count{
//                for edge in edges[cur]{
//                    let next = edge.0
//                    let cost = edge.1
//                    if  result[cur] != Int.max && result[next] > result[cur] + cost{
//                        isCycle = true
//                    }
//                }
//            }
//            if isCycle{ break }
//        }
//        print(isCycle ? "YES" : "NO")
//    }
//}
solution()
